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
      domain = lib.mkOption {
        type = lib.types.str;
        default = "headscale.wastring.com";
        description = "The domain that headscale is served on.";
      };
    };
  };

  config = mkMerge [
    (mkIf config.headscale.enable {
      services = {
        headscale = {
          enable = true;
          address = "0.0.0.0";
          port = 8080;
          server_url = "https://${domain}";
          dns = {
            baseDomain = "example.com";
          };
          settings = {
            logtail.enabled = false;
          };
        };

        nginx.virtualHosts.${domain} = {
          forceSSL = true;
          enableACME = true;
          locations."/" = {
            proxyPass = "http://localhost:${toString config.services.headscale.port}";
            proxyWebsockets = true;
          };
        };
      };
    })
  ];
}
