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

	services.k3s = {
    enable = true;
    role = "server";
    token = "supersupersecretkey";
    clusterInit = true;
  };

	# services = {
	# 	syncthing = {
	# 		enable = true;
	# 		user = "fw";
	# 		dataDir = "/home/fw/syncthing";
	# 		configDir = "/home/fw/.config/syncthing";
	# 		overrideDevices = true;     # overrides any devices added or deleted through the WebUI
	# 		overrideFolders = true;     # overrides any folders added or deleted through the WebUI
	# 	  guiAddress = "0.0.0.0:8384";
	# 		settings = {
	# 		  devices = {
	# 			"desktop" = { id = "BGEQVAA-JZM7DQB-7NFEDQ6-K7Q3HQL-P6OSNJ2-TMA3N7B-E6RP3HQ-OAMWJQL"; };
	# 			"laptop" = { id = "2VEN7O3-PB3G2MK-XJI7R5Z-6MHTNN2-WMXERIX-6G7QWSK-VKSWOSH-Q5WFDAI"; };
	# 		  };
	# 		  folders = {
	# 			"Documents" = {         # Name of folder in Syncthing, also the folder ID
	# 			  path = "/home/fw/docs";    # Which folder to add to Syncthing
	# 			  devices = [ "desktop" ];      # Which devices to share the folder with
	# 			};
	# 		  };
	# 		};
	# 	};
	# };

  services.xserver.dpi = 140;

  system.stateVersion = "23.11";
}
