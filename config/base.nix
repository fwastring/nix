# This is your system's configuration file.
# Use this to configure your system environment (it replaces /etc/nixos/configuration.nix)
{
  inputs,
  lib,
  config,
  pkgs,
  ...
}: {
	imports = [
		# ../shared/vial.nix
	];
  nixpkgs = {
    overlays = [
    ];
    config = {
      allowUnfree = true;
    };
  };

  nix.registry = (lib.mapAttrs (_: flake: {inherit flake;})) ((lib.filterAttrs (_: lib.isType "flake")) inputs);
  nix.nixPath = ["/etc/nix/path"];
  users.defaultUserShell = pkgs.bash;
  documentation.man.generateCaches = false;
  programs.fish.enable = true;
	programs.bash = {
	interactiveShellInit = ''
		if [[ $(${pkgs.procps}/bin/ps --no-header --pid=$PPID --format=comm) != "fish" && -z ''${BASH_EXECUTION_STRING} ]]
		then
		  shopt -q login_shell && LOGIN_OPTION='--login' || LOGIN_OPTION=""
		  exec ${pkgs.fish}/bin/fish $LOGIN_OPTION
		fi
	  '';
	};
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
	liveRestore = false;
  };

	security.rtkit.enable = true;
	services = {
		pipewire = {
			enable = true;
			alsa.enable = true;
			alsa.support32Bit = true;
			pulse.enable = true;
			# If you want to use JACK applications, uncomment this
			jack.enable = true;
		};
	};
  hardware = {
    pulseaudio.enable = false;
    bluetooth = {
      enable = true;
      powerOnBoot = true;
	  settings = {
	  	General = {
			Disable="Headset";
		};
	  };
    };
  };

  networking.networkmanager.enable = true;
  networking.nameservers = [ "8.8.8.8" ];
  # networking.resolvconf.enable = pkgs.lib.mkForce false;
# networking.dhcpcd.extraConfig = "nohook resolv.conf";
# networking.networkmanager.dns = "none";

  environment.sessionVariables = {
    EDITOR  = "nvim";
    TERM = "xterm-256color";
  };

  time.timeZone = "Europe/Stockholm";

  fonts.packages = with pkgs; [
    (nerdfonts.override { 
      fonts = [ 
		"Hack"
        "FiraCode" 
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

  boot.loader = {
	  efi = {
		canTouchEfiVariables = false;
	  };
	  grub = {
		 efiSupport = true;
		 efiInstallAsRemovable = true;
		 device = "nodev";
	  };
	};
  console.keyMap = "sv-latin1";

	environment.systemPackages = with pkgs; [
		vim
		neovim
		git
		openssh
	];


  services = {
 #  	udev = {
	# 	extraRules = ''
	# 		KERNEL=="ttyACM0", MODE:="666"
	# 	'';
	# 	packages = with pkgs; [
	# 		vial
	# 		via
	# 	];
	# };
	picom.enable = true;
    openssh = {
      enable = true;
    };
	strongswan = {
		enable = true;
		secrets = [
		  "ipsec.d/ipsec.nm-l2tp.secrets"
		];
	};
    xserver = {
	  displayManager = {
		  startx.enable = true;
	  };
      enable = true;
	  xkb = {
		  layout = "se";
		  variant = "";
	  };
      windowManager = {
        dwm = {
          enable = true;
        };
      };
    };
    locate = {
      enable = true;
      package = pkgs.mlocate;
	  localuser = null;
    };
    blueman = {
      enable = true;
    };
  };

  system.stateVersion = "23.11";
}

