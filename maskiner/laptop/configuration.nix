# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{
  inputs,
  config,
  pkgs,
  myhostname,
  ...
}:
let
in
{
  imports = [
    ./hardware-configuration.nix

    ../../moduler/base.nix

    inputs.home-manager.nixosModules.home-manager
    ../../moduler/users.nix
    ../../moduler/network.nix
    ../../moduler/programs.nix
    ../../moduler/system.nix
    ../../moduler/dev.nix
    ../../moduler/lsp.nix
    ../../moduler/hyprland.nix
    ../../moduler/sound.nix
  ];

  home-manager.extraSpecialArgs = { inherit inputs pkgs; };
  home-manager.users.fw = {
    imports = [
      ./../../moduler/home.nix
    ];
  };

  boot.kernelPackages = pkgs.linuxPackages_latest;

  networking.hostName = myhostname;


  services = {
    tailscale = {
      enable = true;
      package = pkgs.unstable.tailscale;
    };
    searx = {
      enable = true;
      redisCreateLocally = true;
      settings.server = {
        bind_address = "::1";
        port = 8000;
        secret_key = "alsjdioefj.asdi";
      };
    };
  };

  system.stateVersion = "25.05";
}
