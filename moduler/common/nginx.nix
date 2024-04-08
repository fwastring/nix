
{ pkgs, lib, ... }:
{
  security.acme = {
    acceptTerms = true;
    email = "fredrik@wastring.com";
  };
   
  services.nginx = {
    enable = true;
    recommendedGzipSettings = true;
    recommendedOptimisation = true;
    recommendedProxySettings = true;
    recommendedTlsSettings = true;
	virtualHosts."wastring.com" = { default = true; useACMEHost = "wastring.com"; addSSL = true; locations."/".proxyPass = "http://172.17.0.1:3030/";  };
    };

  # security.acme.certs."wastring.com" = {
  # 		group = "nginx";
		# domain = "wastring.com";
		# dnsProvider = "gandiv5";
		# dnsResolver = "1.1.1.1:53";
		# dnsPropagationCheck = true;
		# credentialsFile = "/home/fw/credentials";
  #   };
}
