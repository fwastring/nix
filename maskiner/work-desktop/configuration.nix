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
    ../../config/base.nix
    ../../shared/openssh.nix
    ../../jobb/users.nix
  ];

  environment.systemPackages = with pkgs; [
    kubectl
    azure-cli
    dotnetCorePackages.sdk_8_0_3xx
    k3s
    cifs-utils
    nfs-utils
  ];

  services.k3s.enable = false;

  services.openiscsi = {
    enable = true;
    name = "iqn.2016-04.com.open-iscsi:work-desktop";
  };

  networking.hostName = myhostname;

  services.xserver.dpi = 140;

  system.stateVersion = "23.11";
}
