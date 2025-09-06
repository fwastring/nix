# This is your system's configuration file.
# Use this to configure your system environment (it replaces /etc/nixos/configuration.nix)
{
  inputs,
  lib,
  config,
  pkgs,
  myhostname,
  ...
}:
{
  # You can import other NixOS modules here
  imports = [
    ./hardware-configuration.nix
    ../../moduler/base.nix
    ../../moduler/users.nix
  ];

  networking.hostName = myhostname;

  services.xserver.dpi = 140;

  services = {
    openssh = {
      enable = true;
      ports = [ 55504 ];
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
  services.syncthing = {
	  enable = true;
	  user = "fw";
	  openDefaultPorts = true; # Open ports in the firewall for Syncthing
	  dataDir = "/home/fw";  # default location for new folders
		configDir = "/home/fw/.config/syncthing";
	  settings = {
		  devices = {
			  "laptop" = { id = "SCW3Z3J-NQHIKXZ-T4MR7JR-YE2VL4S-RDZ7W4F-PMSPWCQ-SGF2XLQ-CDQ3SQT"; };
			  "fw-iphone" = { id = "CWKHS4T-PTMW6A7-EBKRQJW-YOLUWIX-CC5IBYD-Z4LDXTO-MMRHXYM-A2FA2AQ"; };
			};
		  folders = {
			  "vaults" = {
				path = "/home/fw/vaults";
				devices = [ "laptop" "fw-iphone" ];
				ignorePerms = false; # Enable file permission syncing
			  };
			};
		};
	};

  system.stateVersion = "23.11";
}
