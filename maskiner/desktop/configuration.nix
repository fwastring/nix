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
    #../../moduler/lsp.nix
  ];

  environment.systemPackages = with pkgs; [
    unstable.lego
k9s
neovim
  ];

  services.tailscale.enable = true;
  services.tailscale.package = pkgs.unstable.tailscale;
  services.vaultwarden = {
  	enable = true;
      dbBackend = "sqlite";
      environmentFile = "/var/lib/vaultwarden.env";
      config = {
        ROCKET_ADDRESS = "127.0.0.1";
        ROCKET_PORT = 8222;
        DOMAIN = "https://vault.example.org";
        SIGNUPS_ALLOWED = true;
        ADMIN_TOKEN = "$argon2id$v=19$m=65540,t=3,p=4$...";
        LOG_FILE = "/var/lib/bitwarden_rs/access.log";
      };
    };

  networking.hostName = myhostname;

  system.stateVersion = "25.05";
}
