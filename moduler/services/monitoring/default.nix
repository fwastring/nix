{
  lib,
  config,
  ...
}:
with lib;

let

in
{
  options = {
    grafana = {
      enable = mkEnableOption "enables grafana";
      port = lib.mkOption {
        type = lib.types.int;
        default = 2342;
        description = "The port Grafana listens on.";
      };
      host = mkOption {
        type = types.str;
        defaultText = literalExpression "127.0.0.1";
        description = "The hostname that Grafana binds to";
      };
      domain = mkOption {
        type = types.str;
        description = "Domain name for Grafana to be served on.";
      };
    };
    alloy = {
      enable = mkEnableOption "enables alloy";
      configPath = lib.mkOption {
        type = lib.types.path;
        default = ./alloy.yaml;
        description = "The path to the configPath.";
      };
    };
    prometheus = {
      enable = mkEnableOption "enables prometheus";
      port = lib.mkOption {
        type = lib.types.int;
        default = 9001;
        description = "The port Prometheus listens on.";
      };
      exporters = {
        enable = mkEnableOption "enables node exporters";
        port = lib.mkOption {
          type = lib.types.int;
          default = 9002;
          description = "The port Prometheus node exporter listens on.";
        };
      };
    };
    loki = {
      enable = mkEnableOption "enables prometheus";
      configFile = lib.mkOption {
        type = lib.types.path;
        default = ./loki.yaml;
        description = "The path to the configFile.";
      };
      dataDir = lib.mkOption {
        type = lib.types.str;
        default = "/var/loki";
        description = "The path to the data directory.";
      };
    };
  };

  config = mkMerge [
    (mkIf config.grafana.enable {
      services.grafana = {
        enable = true;
        settings = {
          server = {
            domain = config.grafana.domain;
            http_port = config.grafana.port;
            http_addr = config.grafana.host;
          };
        };
      };

      # nginx reverse proxy
      services.nginx.virtualHosts."${config.grafana.domain}" = {
        enableACME = true;
        forceSSL = true;
        locations."/" = {
          proxyPass = "http://${config.grafana.host}:${toString config.grafana.port}";
          proxyWebsockets = true;
          extraConfig = "proxy_ssl_server_name on;" + "proxy_pass_header Authorization;";
        };
      };
    })
    (mkIf config.loki.enable {
      networking.firewall.allowedTCPPorts = [ 3100 ];
      services.loki = {
        enable = true;
        configFile = config.loki.configFile;
        dataDir = config.loki.dataDir;
      };
    })
    (mkIf config.alloy.enable {
      services.alloy = {
        enable = true;
        configPath = config.alloy.configPath;
      };
    })

    (mkIf config.prometheus.enable {
      services.prometheus = {
        enable = true;
        port = config.prometheus.port;
        exporters = mkIf config.prometheus.exporters.enable {
          node = {
            enable = true;
            enabledCollectors = [ "systemd" ];
            port = config.prometheus.exporters.port;
          };
        };
        scrapeConfigs = [
          {
            job_name = "desktop";
            static_configs = [
              {
                targets = [ "${config.grafana.host}:${toString config.prometheus.exporters.port}" ];
              }
            ];
          }
        ];
      };
    })
  ];
}
