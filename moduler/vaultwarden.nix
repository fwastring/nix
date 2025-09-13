{
config,
  ...
}:
{

  networking.firewall = {
    allowedTCPPorts = [
      80
      443
    ];
  };
  security.acme = {
    acceptTerms = true;
    defaults.email = "fredrik@wastring.com";
    certs."pass.wastring.com" = {
      dnsProvider = "gandiv5";
      webroot = null;
      credentialsFile = config.sops.secrets.gandi_key.path;
      dnsPropagationCheck = true;
    };
  };
  services.nginx = {
    enable = true;
    recommendedProxySettings = true;
    recommendedTlsSettings = true;
    virtualHosts."pass.wastring.com" = {
      enableACME = true;
      forceSSL = true;
      locations."/" = {
        proxyPass = "http://127.0.0.1:8222";
        proxyWebsockets = true;
        extraConfig =
          "proxy_ssl_server_name on;" + "proxy_pass_header Authorization;";
      };
    };
  };
  services.vaultwarden = {
    enable = true;
    dbBackend = "sqlite";
    environmentFile = "/var/lib/vaultwarden.env";
    config = {
      ROCKET_ADDRESS = "127.0.0.1";
      ROCKET_PORT = 8222;
      DOMAIN = "https://pass.wastring.com";
      SIGNUPS_ALLOWED = true;
    };
  };
}
