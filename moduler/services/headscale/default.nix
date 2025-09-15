{
  lib,
  config,
  ...
}:
with lib;
{
  options = {
    headscale = {
      enable = mkEnableOption "enables headscale";
      port = lib.mkOption {
        type = lib.types.int;
        default = 8082;
        description = "The port that headscale is served on.";
      };
      domain = lib.mkOption {
        type = lib.types.str;
        default = "headscale.wastring.com";
        description = "The domain that headscale is served on.";
      };
      baseDomain = lib.mkOption {
        type = lib.types.str;
        default = "tailnet.wastring.com";
        description = "The base-domain that headscale is served on.";
      };
    };
  };

  config = mkMerge [
    (mkIf config.headscale.enable {
      services = {
        headscale = {
          enable = true;
          address = "0.0.0.0";
          port = config.headscale.port;
          settings = {
            server_url = "https://${config.headscale.domain}";
            logtail.enabled = false;
            dns = {
              base_domain = config.headscale.baseDomain;
			  nameservers.global = [
			  	"1.1.1.1"
			  	"8.8.8.8"
			  ];
            };
          };
        };

        nginx.virtualHosts.${config.headscale.domain} = {
          forceSSL = true;
          enableACME = true;
          locations."/" = {
            proxyPass = "http://localhost:${toString config.headscale.port}";
            proxyWebsockets = true;
          };
        };
      };
    })
  ];
}
