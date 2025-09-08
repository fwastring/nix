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
    ../../moduler/base.nix
    ../../moduler/users.nix
    ../../moduler/nginx.nix
    ../../moduler/k3s.nix
    ../../moduler/vaultwarden.nix
    #../../moduler/lsp.nix
  ];

  environment.systemPackages = with pkgs; [
    unstable.lego
k9s
neovim
  ];

  services.tailscale.enable = true;
  services.tailscale.package = pkgs.unstable.tailscale;

  networking.hostName = myhostname;

  system.stateVersion = "25.05";
}
