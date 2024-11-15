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
		../../config/users.nix
		../../shared/nginx.nix
	];

	networking.hostName = myhostname;
  nixpkgs = {
    overlays = [
    ];
    config = {
      allowUnfree = true;
    };
  };

	environment.systemPackages = with pkgs; [
	  mergerfs
		unstable.lego
	];
	fileSystems."/data" = {
	  fsType = "fuse.mergerfs";
	  device = "/mnt/drive*";
	  options = ["cache.files=partial" "dropcacheonclose=true" "category.create=mfs"];
	};

  nix.registry = (lib.mapAttrs (_: flake: {inherit flake;})) ((lib.filterAttrs (_: lib.isType "flake")) inputs);

  nix.nixPath = ["/etc/nix/path"];
  environment.etc =
    lib.mapAttrs'
    (name: value: {
      name = "nix/path/${name}";
      value.source = value.flake;
    })
    config.nix.registry;

  nix.settings = {
    experimental-features = "nix-command flakes";
    auto-optimise-store = true;
  };

  virtualisation.docker = {
    enable = true;
  };

  networking.networkmanager.enable = true;

  environment.sessionVariables = {
    EDITOR  = "nvim";
    TERM = "xterm-256color";
  };

  time.timeZone = "Europe/Stockholm";

  fonts.packages = with pkgs; [
    (nerdfonts.override { 
      fonts = [ 
        "FiraCode" 
        "Iosevka" 
        "DroidSansMono" 
      ]; 
    })
  ];


  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "sv_SE.UTF-8";
    LC_IDENTIFICATION = "sv_SE.UTF-8";
    LC_MEASUREMENT = "sv_SE.UTF-8";
    LC_MONETARY = "sv_SE.UTF-8";
    LC_NAME = "sv_SE.UTF-8";
    LC_NUMERIC = "sv_SE.UTF-8";
    LC_PAPER = "sv_SE.UTF-8";
    LC_TELEPHONE = "sv_SE.UTF-8";
    LC_TIME = "sv_SE.UTF-8";
  };

 #  boot.loader.grub = {
	# enable = true;
	# device = "/dev/sdc";
	# useOSProber = true;
 #  };

  console.keyMap = "sv-latin1";
  programs.zsh.enable = true;

  services = {
  xserver = {
	enable = true;
	displayManager = {
		startx.enable = true;
	};
  };
    openssh = {
		enable = true;
		ports = [55502];
		settings = {
			PermitRootLogin = "no";
			PasswordAuthentication = false;
			X11Forwarding = true;
		};
		extraConfig = ''
		  AllowUsers fw
		'';
    };
    locate = {
      enable = true;
      locate = pkgs.mlocate;
    };
  };

  system.stateVersion = "23.11";
}
