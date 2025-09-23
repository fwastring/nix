{
	config,
  ...
}:
{

  services.radicale = {
    enable = true;
    settings = {
		auth.type = "none";
		server.hosts = [ "100.64.0.4:5232" ];
	};
  };
}
