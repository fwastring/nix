{
  lib,
  config,
  ...
}:
with lib;
{
  options = {
    actual = {
      enable = mkEnableOption "enables Actual";
      port = lib.mkOption {
        type = lib.types.int;
        default = 8001;
        description = "The port that Actual is served on.";
      };
      hostname = lib.mkOption {
        type = lib.types.str;
        default = "localhost";
        description = "The hostname that Actual is served on.";
      };
    };
  };

  config = mkMerge [
    (mkIf config.actual.enable {
      services = {
        actual = {
          enable = true;
          openFirewall = true;
          settings = {
            port = config.actual.port;
            hostname = config.actual.hostname;
          };
        };
        nginx.virtualHosts."budget.wastring.com" = {
          forceSSL = true;
          enableACME = true;
          locations."/" = {
            proxyPass = "http://${toString config.actual.hostname}:${toString config.actual.port}";
            proxyWebsockets = true;
          };
        };
      };
    })
  ];
}
