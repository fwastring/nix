{
  lib,
  config,
  pkgs,
  ...
}:
with lib;

let

in
{
  options = {
    wireguard-server = {
      enable = mkEnableOption "enables wireguard-server";
      port = lib.mkOption {
        type = lib.types.int;
        default = 51820;
        description = "The port that the Wireguard server listens on.";
      };
    };
  };

  config = mkMerge [
    (mkIf config.loki.enable {
      sops.secrets.wireguard_private_key = {};
	  users.users."systemd-network".extraGroups = [ "keys" ];
      networking.nat.enable = true;
      networking.nat.externalInterface = "eth0";
      networking.nat.internalInterfaces = [ "wg0" ];
      networking.firewall = {
        allowedUDPPorts = [ config.wireguard-server.port ];
      };

      networking.wireguard.enable = true;
      networking.wireguard.interfaces = {
        wg0 = {
          ips = [ "10.100.0.1/24" ];

          listenPort = config.wireguard-server.port;

          postSetup = ''
            ${pkgs.iptables}/bin/iptables -t nat -A POSTROUTING -s 10.100.0.0/24 -o eth0 -j MASQUERADE
          '';

          postShutdown = ''
            ${pkgs.iptables}/bin/iptables -t nat -D POSTROUTING -s 10.100.0.0/24 -o eth0 -j MASQUERADE
          '';

          privateKeyFile = config.sops.secrets.wireguard_private_key.path;

          peers = [
            {
              name = "fwastring";
              publicKey = "iJw5Km99HT9/TuVtSyDhOwPPcoWeRO67dhhrKPbjRTA=";
              allowedIPs = [ "10.100.0.2/32" ];
            }
          ];
        };
      };
    })
  ];
}
