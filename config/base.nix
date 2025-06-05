# This is your system's configuration file.
# Use this to configure your system environment (it replaces /etc/nixos/configuration.nix)
{
  inputs,
  lib,
  config,
  pkgs,
  ...
}:
{
  imports = [
    ./dev.nix
    ./lsp.nix
    ./network.nix
    ./programs.nix
    ./system.nix
  ];
  nixpkgs = {
    overlays = [
    ];
    config = {
      allowUnfree = true;
    };
  };

  nix.registry = (lib.mapAttrs (_: flake: { inherit flake; })) (
    (lib.filterAttrs (_: lib.isType "flake")) inputs
  );
  nix.nixPath = [ "/etc/nix/path" ];
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
  environment.etc = lib.mapAttrs' (name: value: {
    name = "nix/path/${name}";
    value.source = value.flake;
  }) config.nix.registry;

  nix.settings = {
    experimental-features = "nix-command flakes";
    auto-optimise-store = true;
  };

  virtualisation.docker = {
    enable = true;
    liveRestore = false;
  };

  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services = {
    tailscale = {
      enable = true;
    };
    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
    };
  };
  hardware = {
    bluetooth = {
      enable = true;
      powerOnBoot = true;
      settings = {
        General = {
          Disable = "Headset";
        };
      };
    };
  };

  networking.networkmanager.enable = true;

  environment.sessionVariables = {
    EDITOR = "nvim";
    VISUAL = "nvim";
    TERM = "xterm-256color";
  };

  time.timeZone = "Europe/Stockholm";

  fonts.packages = with pkgs; [
    nerd-fonts.comic-shanns-mono
	nerd-fonts.fira-code
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
	(st.overrideAttrs (oldAttrs: rec {
		src = builtins.fetchGit {
			url = "https://github.com/fwastring/st";
      rev = "de286ce570c23e037a0e5fb7d84ac7226aef1259";
		};
		buildInputs = oldAttrs.buildInputs ++ [ xorg.libX11.dev xorg.libXft imlib2 xorg.libXinerama pkg-config];
	  }))
	(dmenu.overrideAttrs (oldAttrs: rec {
		src = builtins.fetchGit {
			url = "https://github.com/fwastring/dmenu";
      rev = "2f09f9ead8c2736dbca838393f97e5a0e4e55a2e";
		};
		buildInputs = oldAttrs.buildInputs ++ [ xorg.libX11.dev xorg.libXft imlib2 xorg.libXinerama pkg-config];
	  }))
  ];

  programs.slock = {
  	enable = true;
	package = with pkgs; (slock.overrideAttrs (oldAttrs: rec {
		src = builtins.fetchGit {
			url = "https://github.com/fwastring/slock";
      rev = "53ada91fefc22f6c9c76ef71b9741b385b6bedfb";
		};
		buildInputs = oldAttrs.buildInputs ++ [ xorg.libX11.dev xorg.libXft imlib2 xorg.libXinerama pkg-config xorg.libXrandr xorg.xrandr libxcrypt xorg.libXext xorg.xorgproto];
	  }));
  };


  services = {
    picom.enable = true;
	clipmenu.enable = true;
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
	  windowManager.dwm = {
      enable = true;
		};
    };
    blueman = {
      enable = true;
    };
  };

  system.stateVersion = "23.11";
}
