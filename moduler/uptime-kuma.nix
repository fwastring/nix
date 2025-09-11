{
  lib,
  config,
  pkgs,
  ...
}:
let
in
{
  networking.firewall.allowedTCPPorts = [ 4000 ];

  services = {
    uptime-kuma = {
      enable = true;
      settings = {
        PORT = "4000";
        HOST = "192.168.1.227";
      };
    };
  };
}
