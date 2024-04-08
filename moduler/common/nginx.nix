
{ pkgs, lib, ... }:
{
  security.acme = {
    acceptTerms = true;
    email = "fredrik@wastring.com";
	certs."git.wastring.com" = {
		dnsProvider = "gandi";
		# Supplying password files like this will make your credentials world-readable
		# in the Nix store. This is for demonstration purpose only, do not use this in production.
		credentialsFile = /home/fw/credentials.sh;
  };
    };
   
  services.nginx = {
    enable = true;
    recommendedGzipSettings = true;
    recommendedOptimisation = true;
    recommendedProxySettings = true;
    recommendedTlsSettings = true;
virtualHosts."git.wastring.com" = { default = true; enableACME = true; addSSL = true; locations."/".proxyPass = "http://172.17.0.1:3030/"; };
    };
}
