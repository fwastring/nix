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

	environment.systemPackages = with pkgs; [
		qgis
		koreader
		foliate
		k3sup
	];

	# boot.loader = {
	# 	efi = {
	# 		canTouchEfiVariables = true;
	# 	};
	# 	grub = {
	# 		enable = true;
	# 		efiSupport = true;
	# 		useOSProber = true;
	# 	};
	# };


	services.xserver.dpi = 140;

	services = {
		openssh = {
			enable = true;
			ports = [55504];
			settings = {
				PermitRootLogin = "no";
				PasswordAuthentication = false;
				X11Forwarding = true;
			};
			extraConfig = ''
			  AllowUsers fw
			'';
		};
	};

	system.stateVersion = "23.11";
}
