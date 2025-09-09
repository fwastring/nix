{
  ...
}:
{

	networking.firewall = {
	allowedTCPPorts = [ 80 443 ];
	};
  security.acme = {
    acceptTerms = true;
    defaults.email = "fredrik@wastring.com";
    certs."pass.wastring.com" = {
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
    # other Nginx options
    virtualHosts."pass.wastring.com" = {
      enableACME = true;
      forceSSL = true;
      locations."/" = {
        proxyPass = "http://127.0.0.1:8222";
        proxyWebsockets = true; # needed if you need to use WebSocket
        extraConfig =
          # required when the target is also TLS server with multiple hosts
          "proxy_ssl_server_name on;"
          +
            # required when the server wants to use HTTP Authentication
            "proxy_pass_header Authorization;";
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
