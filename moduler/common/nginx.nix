{ pkgs, lib, ... }:
{
networking.firewall = {
    allowedTCPPorts = [ 80 443 ];
  };
  services.nginx = {
    enable = true;

    # Use recommended settings
    recommendedGzipSettings = true;
    recommendedOptimisation = true;
    recommendedProxySettings = true;
    recommendedTlsSettings = true;

  virtualHosts = {
        "git.wastring.com" = {
                sslCertificateKey = "/certs/.lego/certificates/wastring.com.key";
                sslCertificate = "/certs/.lego/certificates/wastring.com.crt";
        forceSSL = true;
        locations."/" = {
          proxyPass = "http://172.17.0.1:3009";
          proxyWebsockets = true;
        };
      };
        "cal.wastring.com" = {
                sslCertificateKey = "/certs/.lego/certificates/wastring.com.key";
                sslCertificate = "/certs/.lego/certificates/wastring.com.crt";
        forceSSL = true;
        locations."/" = {
          proxyPass = "http://172.17.0.1:5232";
          proxyWebsockets = true;
        };
      };
        "warden.wastring.com" = {
                sslCertificateKey = "/certs/.lego/certificates/wastring.com.key";
                sslCertificate = "/certs/.lego/certificates/wastring.com.crt";
        forceSSL = true;
        locations."/" = {
          proxyPass = "http://172.17.0.1:8083";
          proxyWebsockets = true;
        };
      };
        "home.wastring.com" = {
                sslCertificateKey = "/certs/.lego/certificates/wastring.com.key";
                sslCertificate = "/certs/.lego/certificates/wastring.com.crt";
        forceSSL = true;
        locations."/" = {
          proxyPass = "http://172.17.0.1:8085";
          proxyWebsockets = true;
        };
      };
        "search.wastring.com" = {
                sslCertificateKey = "/certs/.lego/certificates/wastring.com.key";
                sslCertificate = "/certs/.lego/certificates/wastring.com.crt";
        forceSSL = true;
        locations."/" = {
          proxyPass = "http://172.17.0.1:8060";
          proxyWebsockets = true;
        };
      };
        "docs.wastring.com" = {
                sslCertificateKey = "/certs/.lego/certificates/wastring.com.key";
                sslCertificate = "/certs/.lego/certificates/wastring.com.crt";
        forceSSL = true;
        locations."/" = {
          proxyPass = "http://172.17.0.1:8003";
          proxyWebsockets = true;
        };
      };
        "bilder.wastring.com" = {
                sslCertificateKey = "/certs/.lego/certificates/wastring.com.key";
                sslCertificate = "/certs/.lego/certificates/wastring.com.crt";
        forceSSL = true;
        locations."/" = {
          proxyPass = "http://172.17.0.1:2283";
          proxyWebsockets = true;
        };
      };
        "wastring.com" = {
                sslCertificateKey = "/certs/.lego/certificates/wastring.com.key";
                sslCertificate = "/certs/.lego/certificates/wastring.com.crt";
        forceSSL = true;
        locations."/" = {
          proxyPass = "http://172.17.0.1:8085";
          proxyWebsockets = true;
        };
      };
  };
};
}

