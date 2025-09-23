{
  lib,
  config,
  pkgs,
  ...
}:
let
in
{
  security.acme = {
    acceptTerms = true;
    defaults.email = "fredrik@wastring.com";
    certs."shop.wastring.com" = {
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
  virtualisation.oci-containers = {
    backend = "podman";
	containers = {
		kitchenowl = {
			image = "tombursch/kitchenowl:latest";
			volumes = [
			  "/var/kitchenowl:/data"
			];
			ports = [ "127.0.0.1:8080:8080" ];
			environment = {
			  JWT_SECRET_KEY = "jkdlaksjdljlkjlq";
			}
			;
		};
	};
  };
}
