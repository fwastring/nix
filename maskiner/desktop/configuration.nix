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
    ../../moduler/kitchenowl.nix
    ../../moduler/radicale.nix
    #../../moduler/nginx.nix
    #../../moduler/k3s.nix
    ../../moduler/vaultwarden.nix
    #../../moduler/lsp.nix
  ];

  environment.systemPackages = with pkgs; [
    neovim
    git
  ];


  security.acme = {
    acceptTerms = true;
    defaults.email = "fredrik@wastring.com";
    certs."shop.wastring.com" = {
      dnsProvider = "gandiv5";
      webroot = null;
      credentialsFile = /run/secrets/gandi_key;
      dnsPropagationCheck = true;
    };
  };
  services.nginx = {
    enable = true;
    recommendedProxySettings = true;
    recommendedTlsSettings = true;
    virtualHosts."shop.wastring.com" = {
      enableACME = true;
      forceSSL = true;
      locations."/" = {
        proxyPass = "http://127.0.0.1:8080";
        proxyWebsockets = true;
        extraConfig =
          "proxy_ssl_server_name on;"
          +
            # required when the server wants to use HTTP Authentication
            "proxy_pass_header Authorization;";
      };
    };
  };

  networking.hostName = myhostname;

  system.stateVersion = "25.05";
}
