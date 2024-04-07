# This is your system's configuration file.
# Use this to configure your system environment (it replaces /etc/nixos/configuration.nix)
{
  inputs,
  lib,
  config,
  pkgs,
  ...
}: {
  # You can import other NixOS modules here
  imports = [
    ./hardware-configuration.nix
	../../config/base.nix
	../../config/users.nix
  ];

  security.rtkit.enable = true;
  networking.hostName = "nix-desktop";

  services.xserver.dpi = 100;

  system.stateVersion = "23.11";
}
