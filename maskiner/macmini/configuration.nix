# This is your system's configuration file.
# Use this to configure your system environment (it replaces /etc/nixos/configuration.nix)
{
  inputs,
  lib,
  config,
  pkgs,
  myhostname,
  ...
}:
{
  # You can import other NixOS modules here
  imports = [
    ./hardware-configuration.nix
    ../../config/users.nix
  ];

  environment.systemPackages = with pkgs; [
    unstable.lego
  ];
  networking.firewall = {
    enable = true;
    allowedTCPPorts = [
      80
      443
      3000
      8384
      8008
      8009
      22000
    ];
    allowedUDPPortRanges = [
      {
        from = 1;
        to = 65535;
      }
    ];
  };

  networking.firewall.allowedUDPPorts = [
    22000
    21027
  ];

  services = {
    openssh = {
      enable = true;
      ports = [ 22 ];
      settings = {
        PermitRootLogin = "no";
        PasswordAuthentication = false;
        X11Forwarding = true;
      };
      extraConfig = ''
        			  AllowUsers fw
        			'';
    };
  };

  security.rtkit.enable = true;
  networking.hostName = myhostname;

  services.xserver.dpi = 100;

  system.stateVersion = "24.11";
}
