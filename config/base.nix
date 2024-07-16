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
		../shared/vial.nix
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
  # environment.systemPackages = with pkgs; [
  # ];
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

  hardware = {
    pulseaudio.enable = true;
    bluetooth = {
      enable = true;
      powerOnBoot = true;
    };
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

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  console.keyMap = "sv-latin1";

	# systemd.services.vdirsyncer = {
	#   serviceConfig.Type = "oneshot";
	#   serviceConfig.User = "fw";
	#   path = with pkgs; [ vdirsyncer ];
	#   script = ''
	# 	vdirsyncer -c "/home/fw/.config/vdirsyncer/config" sync
	#   '';
	# };
	# systemd.timers.vdirsyncer = {
	#   wantedBy = [ "timers.target" ];
	#   partOf = [ "vdirsyncer.service" ];
	#   timerConfig = {
	# 	OnBootSec = "5m";
	# 	OnUnitActiveSec = "5m";
	# 	Unit = "vdirsyncer.service";
	#   };
	# };

	environment.systemPackages = with pkgs; [(
		catppuccin-sddm.override {
			flavor = "mocha";
			font  = "FiraCode Nerd Font Bold";
			fontSize = "17";
			background = "${../wallpapers/inverted.png}";
			loginBackground = true;
		}
	)];


  services = {
  	udev = {
		packages = with pkgs; [
			vial
			via
		];
	};
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
      enable = true;
	  xkb = {
		  layout = "se";
		  variant = "";
	  };
      displayManager = {
		sddm = {
		  enable = true;
		  theme = "catppuccin-mocha";
		  package = pkgs.kdePackages.sddm;
		};
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

