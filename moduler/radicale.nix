{
	config,
  ...
}:
{

  security.acme = {
    certs."cal.wastring.com" = {
      dnsProvider = "gandiv5";
      webroot = null;
      credentialsFile = config.sops.secrets.gandi_key.path;
      dnsPropagationCheck = true;
    };
  };
  # services.nginx = {
  #   virtualHosts."cal.wastring.com" = {
  #     enableACME = true;
  #     forceSSL = true;
  #     locations."/" = {
  #       proxyPass = "http://127.0.0.1:5232";
  #       proxyWebsockets = true; # needed if you need to use WebSocket
  #       extraConfig = "proxy_ssl_server_name on;" + "proxy_pass_header Authorization;";
  #     };
  #   };
  # };
  services.radicale = {
    enable = true;
    settings = {
		auth.type = "none";
		server.hosts = [ "0.0.0.0:5232" ];
	};
  };
}
