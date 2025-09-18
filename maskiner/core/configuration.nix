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

    ../../moduler/users.nix
    ../../moduler/network.nix
    ../../moduler/programs.nix
    ../../moduler/system.nix
    ../../moduler/dev.nix
    ../../moduler/lsp.nix
    ../../moduler/hyprland.nix
    ../../moduler/sound.nix
    ../../moduler/programs/kubernetes-tools.nix
  ];

  kubernetes-tools.enable = true;

  stylix = {
    enable = true;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-latte.yaml";
  };

  programs.ssh.knownHosts = {
    desktop = {
      extraHostNames = [ "192.168.1.227" ];
      publicKeyFile = ../../keys/rsa_pubkey;
    };
    "192.168.1.227" = {
      publicKeyFile = ../../keys/rsa_pubkey;
    };
  };

  home-manager.extraSpecialArgs = { inherit inputs pkgs; };
  home-manager.users.fw = {
    imports = [
      ./../../moduler/home.nix
    ];
    programs.ranger.enable = true;
    stylix.targets = {
      lazygit.enable = false;
      fish.enable = false;
      kitty.enable = false;
      waybar.enable = false;
      tmux.enable = false;
      k9s.enable = false;
    };
  };

  boot.kernelPackages = pkgs.linuxPackages_latest;
  boot.extraModulePackages = [
    (btusb.overrideAttrs (_: {
      patches = [ ../../moduler/btusb-add-mt7925.patch ];
    }))
  ];

  networking.hostName = myhostname;

  services = {
    tailscale = {
      enable = true;
    };
  };

  system.stateVersion = "25.05";
}
