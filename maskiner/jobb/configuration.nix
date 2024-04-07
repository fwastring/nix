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

  networking.hostName = "fw-jobb";

  services.xserver.dpi = 140;

  system.stateVersion = "23.11";
}
