{ pkgs, lib, ... }:
{
networking.firewall = {
    allowedTCPPorts = [ 80 443 ];
  };
  services.nginx = {
    enable = true;
	user = "nginx";
	group = "nginx";

    # Use recommended settings
    recommendedGzipSettings = true;
    recommendedOptimisation = true;
    recommendedProxySettings = true;
    recommendedTlsSettings = true;

  virtualHosts = {
        "bilder.wastring.com" = {
                sslCertificateKey = "/certs/.lego/certificates/wastring.com.key";
                sslCertificate = "/certs/.lego/certificates/wastring.com.crt";
        forceSSL = true;
        locations."/" = {
          proxyPass = "http://172.17.0.1:2283";
          proxyWebsockets = true;
        };
      };
        "git.wastring.com" = {
                sslCertificateKey = "/certs/.lego/certificates/wastring.com.key";
                sslCertificate = "/certs/.lego/certificates/wastring.com.crt";
        forceSSL = true;
        locations."/" = {
          proxyPass = "http://192.168.16.1:3000";
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
        "pass.wastring.com" = {
                sslCertificateKey = "/certs/.lego/certificates/wastring.com.key";
                sslCertificate = "/certs/.lego/certificates/wastring.com.crt";
        forceSSL = true;
        locations."/" = {
          proxyPass = "http://172.24.0.1:9445";
          proxyWebsockets = true;
        };
      };
        "home.wastring.com" = {
                sslCertificateKey = "/certs/.lego/certificates/wastring.com.key";
                sslCertificate = "/certs/.lego/certificates/wastring.com.crt";
        forceSSL = true;
        locations."/" = {
          proxyPass = "http://172.17.0.1:8081";
          proxyWebsockets = true;
        };
      };
        "drive.wastring.com" = {
                sslCertificateKey = "/certs/.lego/certificates/wastring.com.key";
                sslCertificate = "/certs/.lego/certificates/wastring.com.crt";
        forceSSL = true;
        locations."/" = {
          proxyPass = "http://172.17.0.1:3001";
          proxyWebsockets = true;
        };
      };

        "sandbox.wastring.com" = {
                sslCertificateKey = "/certs/.lego/certificates/wastring.com.key";
                sslCertificate = "/certs/.lego/certificates/wastring.com.crt";
        forceSSL = true;
        locations."/" = {
          proxyPass = "http://172.17.0.1:3001";
          proxyWebsockets = true;
        };
      };
        "files.wastring.com" = {
                sslCertificateKey = "/certs/.lego/certificates/wastring.com.key";
                sslCertificate = "/certs/.lego/certificates/wastring.com.crt";
        forceSSL = true;
        locations."/" = {
          proxyPass = "http://172.17.0.1:3923";
          proxyWebsockets = true;
        };
      };
        "ftp.wastring.com" = {
                sslCertificateKey = "/certs/.lego/certificates/wastring.com.key";
                sslCertificate = "/certs/.lego/certificates/wastring.com.crt";
        forceSSL = true;
        locations."/" = {
          proxyPass = "http://172.17.0.1:3921";
          proxyWebsockets = true;
        };
      };
  };
};
}

