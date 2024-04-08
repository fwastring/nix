
{ pkgs, lib, ... }:
{
networking.firewall = {
    allowedTCPPorts = [ 80 443 ];
  };
virtualisation.oci-containers = {
    containers = {
      "gitea" = {
        image = "gitea/gitea:1.15.6-rootless";
        ports = [ "3030:3000" ];
      };
    };
  };
  services.nginx = {
    enable = true;

    # Use recommended settings
    recommendedGzipSettings = true;
    recommendedOptimisation = true;
    recommendedProxySettings = true;
    recommendedTlsSettings = true;

    # Only allow PFS-enabled ciphers with AES256
    # sslCiphers = "AES256+EECDH:AES256+EDH:!aNULL";

    # Add any further config to match your needs, e.g.:
    virtualHosts = let
      base = locations: {
        inherit locations;

        addSSL = true;
		sslCertificateKey = "/home/fw/nix-config/.lego/certificates/wastring.com.key";
		sslCertificate = "/home/fw/nix-config/.lego/certificates/wastring.com.crt";
		# sslTrustedCertificate = "/home/fw/nix-config/.lego/certificates/wastring.com.issuer.crt";
      };
      proxy = port: base {
        "/" = {
			proxyPass = "http://172.17.0.1:" + toString(port) + "/";
			proxyWebsockets = true;
		};
      };
    in {
      # Define example.com as reverse-proxied service on 127.0.0.1:3000
      "git.wastring.com" = proxy 3030 // { default = true; };
    };
};
  
}
