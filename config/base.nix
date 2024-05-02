# This is your system's configuration file.
# Use this to configure your system environment (it replaces /etc/nixos/configuration.nix)
{
  inputs,
  lib,
  config,
  pkgs,
  ...
}: {
  nixpkgs = {
    overlays = [
    ];
    config = {
      allowUnfree = true;
    };
  };

  nix.registry = (lib.mapAttrs (_: flake: {inherit flake;})) ((lib.filterAttrs (_: lib.isType "flake")) inputs);
  nix.nixPath = ["/etc/nix/path"];
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
  users.defaultUserShell = pkgs.bash;
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
  # programs.zsh.enable = true;

  services = {
    openssh = {
      enable = true;
    };
	picom = {
	  enable = true;
	  fade = true;
	  fadeDelta = 15;
	};
	spotifyd = {
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
      layout = "se";
      xkbVariant = "";
      displayManager = {
        startx = {
         enable = true;
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
      locate = pkgs.mlocate;
    };
    blueman = {
      enable = true;
    };
  };

  system.stateVersion = "23.11";
}

