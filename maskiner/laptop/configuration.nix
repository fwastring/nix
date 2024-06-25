# This is your system's configuration file.
# Use this to configure your system environment (it replaces /etc/nixos/configuration.nix)
{
  inputs,
  lib,
  config,
  pkgs,
  myhostname,
  ...
}: {
	# You can import other NixOS modules here
	imports = [
	./hardware-configuration.nix
	../../config/base.nix
	../../config/users.nix
	];

	networking.hostName = myhostname;

	services.xserver.dpi = 140;
	services = {
		syncthing = {
			enable = true;
			user = "fw";
			dataDir = "/home/fw/syncthing";
			configDir = "/home/fw/.config/syncthing";
			overrideDevices = true;     # overrides any devices added or deleted through the WebUI
			overrideFolders = true;     # overrides any folders added or deleted through the WebUI
		  guiAddress = "0.0.0.0:8384";
			settings = {
			  devices = {
				"desktop" = { id = "BGEQVAA-JZM7DQB-7NFEDQ6-K7Q3HQL-P6OSNJ2-TMA3N7B-E6RP3HQ-OAMWJQL"; };
				# "device2" = { id = "DEVICE-ID-GOES-HERE"; };
			  };
			  folders = {
				"Documents" = {         # Name of folder in Syncthing, also the folder ID
				  path = "/home/fw/docs";    # Which folder to add to Syncthing
				  devices = [ "desktop" ];      # Which devices to share the folder with
				};
			  };
			};
		};
	};
	# services.spotifyd.settings.password = config.sops.secrets."spotify_password".path;
	# https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
	system.stateVersion = "23.11";
}
