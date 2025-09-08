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
  btusb = pkgs.callPackage ../../moduler/btusb.nix { inherit (config.boot.kernelPackages) kernel; };
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
  boot.extraModulePackages = [
    (btusb.overrideAttrs (_: {
      patches = [ ../../moduler/btusb-add-mt7925.patch ];
    }))
  ];
  hardware.enableRedistributableFirmware = true;

  networking.hostName = myhostname;

  environment.systemPackages = with pkgs; [
    gonic
  ];

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
