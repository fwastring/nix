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
    unstable.lego
    k9s
    neovim
    git
  ];


nix.settings = {
  trusted-public-keys = [
    "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
    "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="
  ];
};

security.sudo.wheelNeedsPassword = false;
users.users.root.openssh.authorizedKeys.keys = [
            "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDALsdpwvC0w/Aj+1fWtzJyyWoUrGkdh8o2thVHeQQBNo0D7cmVberYmi4Cv9gWGX6PaElrnOl0KRdGyro2wxOYokSxgk2VgWW67BFITAQAbKyG2NhXXPbhb4jccDo7WH7TtOG8IofuJTPRu1Duda6k4RN0I0CkyAN6LGX+zy49cq0qKf9ijXYhCDYNih3+Fu/ig0aW/SYmsVoUl2VFTWdI5x5/wLvIjTEZhmAtYIeYADaLnom356cFrUysZa++FUujQAz3Ow236BvP95XZdTsqvfWNZFNIpC9VYF72JeIDCs5wDIr0GFmanF2On1nar+jJpoOE8SdHt357p5g/PqXV5TisN2xQRkqVwO9tWtMl4sF84jA4ULnY2gQWv9jErMxymUQ1IwuPUzDDlbRHCtfexAtkBy7wv6xslKAzG1QahvF/btNs5Caj3LN31rgAuxyooCbKGKTeBP3kHPKcz1iupgidfbO/QqVXBRQJTEdGyAKa8hVmLQZZPC/XUhxESAk= fw@fw-nix"
            "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC8ku8iCb7tXd/tfxYDW+Tj8K9kpfrYZciYUZ6tBpO80inm4EImtfyEeJTuqDWMKov2BftUKs8brNeTBCXUEvU1P0+cpOP9RtYA5tfBXf3su+iVSswJJStIxNboXHrEGKdJJRNsTv/9agshDSUBy6G5TI1cXhv/updornfA4fwOMqOmtlYEn6XCRnsrO6NBLc/uLckdbF75HOsoLvezRvuqTLjpapjaUKGVPrgNXiclIKHmuOx71kgD4FX3rSz9FgKjnfu3a7DBbrHsf/g+N9PjNF1muN9UOV6nK3WwiO9BMWi7NpAWfzJOeZg9chqzI+U6CcsqYVeESgL41so+dnv3 fw@laptop"
	    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIP34dnsZSnWdDvd+3BXDwcw7wP0PjPEx2eCdBQJyGD6O fw@laptop"
	    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAII60tdNsG0z9q2jHmoTKvkeLQE6OF0bmTsDX1bpqpoG7 fw@jobb"
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

  # services.tailscale.enable = true;
  # services.tailscale.package = pkgs.unstable.tailscale;

  networking.hostName = myhostname;

  system.stateVersion = "25.05";
}
