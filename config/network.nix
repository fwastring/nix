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

	services.netbird = {
		enable = true;
		ui.enable = true;
	};

  	environment.systemPackages = with pkgs; [
		openvpn
		networkmanagerapplet
		networkmanager-l2tp
		strongswan
		networkmanager_strongswan
		wireguard-tools
		networkmanager
		openssh
		dig
	];
}
