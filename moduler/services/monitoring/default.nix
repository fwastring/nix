{
  lib,
  config,
  pkgs,
  ...
}:
{
  options = {
    grafana = {
      enable = lib.mkEnableOption "enables grafana";
      host = lib.mkDefault "127.0.0.1";
      port = lib.mkDefault 2342;
      domain = lib.mkOption {
        type = lib.types.str;
        description = "Domain name for Grafana to be served on.";
      };
    };
    prometheus = {
      enable = lib.mkEnableOption "enables prometheus";
      port = lib.mkDefault 9001;
      exporter = {
        enable = lib.mkEnableOption "enables node exporter";
        port = lib.mkDefault 9002;
      };
    };
  };

  config = lib.mkMerge [
    (lib.mkIf config.grafana.enable {
      services.grafana = {
        enable = true;
        domain = config.grafana.domain;
        port = config.grafana.port;
        addr = config.grafana.host;
      };

      # nginx reverse proxy
      services.nginx.virtualHosts."${config.grafana.domain}" = {
        locations."/" = {
          proxyPass = "http://${config.grafana.host}:${toString config.grafana.port}";
          proxyWebsockets = true;
        };
      };
    })

    (lib.mkIf config.prometheus.enable {
      services.prometheus = {
        enable = true;
        port = config.prometheus.port;
        exporters = lib.mkIf config.prometheus.exporters {
          node = {
            enable = true;
            enabledCollectors = [ "systemd" ];
            port = config.prometheus.exporters.port;
          };
        };
        scrapeConfigs = [
          {
            job_name = "chrysalis";
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
