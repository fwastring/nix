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
		package = pkgs.unstable.netbird;
	};

  	environment.systemPackages = with pkgs; [
		openvpn
		networkmanagerapplet
		wireguard-tools
		networkmanager
		openssh

		mtr # A network diagnostic tool
		iperf3
		dnsutils  # `dig` + `nslookup`
		ldns # replacement of `dig`, it provide the command `drill`
		aria2 # A lightweight multi-protocol & multi-source command-line download utility
		socat # replacement of openbsd-netcat
		nmap # A utility for network discovery and security auditing
		ipcalc  # it is a calculator for the IPv4/v6 addresses
	];
}
