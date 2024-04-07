{ pkgs, lib, myhostname, ... }:
{
  services.spotifyd = {
  	enable = true;
	settings = {
		username = "fredzyw";
		device_name = myhostname;
	};
  };
}
