# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{
  inputs,
  lib,
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
    # Include the results of the hardware scan.
    ./hardware-configuration.nix

    ../../moduler/base.nix

    inputs.home-manager.nixosModules.home-manager
    ../../moduler/users.nix
    ../../moduler/network.nix
    ../../moduler/programs.nix
    ../../moduler/system.nix
    ../../moduler/dev.nix
    ../../moduler/lsp.nix
    ../../moduler/sway.nix
    ../../moduler/hyprland.nix
    ../../moduler/sound.nix
  ];

  home-manager.extraSpecialArgs = { inherit inputs pkgs; };
  home-manager.users.fw = {
    imports = [
      ./../../moduler/home.nix
    ];
  };

  # Bootloader.
  boot.kernelPackages = pkgs.linuxPackages_latest;
  boot.extraModulePackages = [
    (btusb.overrideAttrs (_: {
      patches = [ ../../moduler/btusb-add-mt7925.patch ];
    }))
  ];
  hardware.enableRedistributableFirmware = true;

  networking.hostName = myhostname; # Define your hostname.


  services = {
    #tailscale.enable = true;
    picom.enable = true;
    openssh = {
      enable = true;
    };
    blueman = {
      enable = true;
    };
	printing.enable = true;
  };

  # Configure console keymap
  console.keyMap = "sv-latin1";

  services.xserver.dpi = 140;

  system.stateVersion = "25.05"; # Did you read the comment?
}
