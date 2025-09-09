{
  ...
}:
{

  security.acme = {
    certs."cal.wastring.com" = {
      dnsProvider = "gandiv5";
      webroot = null;
      credentialsFile = /run/secrets/gandi_key;
      dnsPropagationCheck = true;
    };
  };
  services.nginx = {
    virtualHosts."cal.wastring.com" = {
      enableACME = true;
      forceSSL = true;
      locations."/" = {
        proxyPass = "http://127.0.0.1:5232";
        proxyWebsockets = true; # needed if you need to use WebSocket
        extraConfig = "proxy_ssl_server_name on;" + "proxy_pass_header Authorization;";
      };
    };
  };
  services.radicale = {
    enable = true;
    settings.server.hosts = [ "0.0.0.0:5232" ];
  };
}
