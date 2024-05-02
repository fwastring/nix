{ pkgs, lib, myhostname, sops, ... }:
{
  services.spotifyd = {
  	enable = true;
	settings = {
		username = "fredzyw";
		# password = sops.secrets.spotify_password;
		device_name = myhostname;
	};
  };
}
