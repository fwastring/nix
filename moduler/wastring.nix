{ config, inputs, pkgs, ... }:

let
in
{
  security.acme = {
    certs."wastring.com" = {
      dnsProvider = "gandiv5";
      webroot = null;
      credentialsFile = /run/secrets/gandi_key;
      dnsPropagationCheck = true;
    };
  };
  services.nginx = {
    virtualHosts."wastring.com" = {
      enableACME = true;
      forceSSL = true;
	  root = "/var/www/wastring.com";
    };
  };
}
