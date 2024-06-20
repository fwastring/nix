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
	../../shared/nginx.nix
  ];

	environment.systemPackages = with pkgs; [
		unstable.lego
	];
networking.firewall = {
  enable = true;
  allowedTCPPorts = [ 80 443 ];
  allowedUDPPortRanges = [
    { from = 4000; to = 4007; }
    { from = 8000; to = 8010; }
  ];
};
	services = {
		openssh = {
			enable = true;
			ports = [55502];
			settings = {
				PermitRootLogin = "no";
				PasswordAuthentication = false;
				X11Forwarding = true;
			};
			extraConfig = ''
			  AllowUsers fw ios
			'';
		};
	};


  security.rtkit.enable = true;
  networking.hostName = myhostname;

  services.xserver.dpi = 100;

  system.stateVersion = "23.11";
}
