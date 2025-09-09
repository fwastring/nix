{
  host,
  config,
  pkgs,
  inputs,
  ...
}:
let
in
{
  environment.systemPackages = with pkgs; [
    swww
    grim
    slurp
    wl-clipboard
    swappy
    ydotool
    hyprpolkitagent
    hyprland-qtutils
    waypipe
	wmenu
  ];


  services = {
    gnome.gnome-keyring.enable = true;
    greetd = {
      enable = true;
      settings = {
        default_session = {
          command = "${pkgs.greetd.tuigreet}/bin/tuigreet --time --cmd hyprland";
          user = "greeter";
        };
      };
    };
  };

  nix.settings = {
    substituters = [ "https://hyprland.cachix.org" ];
    trusted-substituters = [ "https://hyprland.cachix.org" ];
    trusted-public-keys = [ "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc=" ];
  };
  programs.hyprland = {
    enable = true;
    package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
    portalPackage =
      inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland;
  };
  home-manager.users.fw =
    { pkgs, ... }:
    {
      imports = [
        ./waybar.nix
      ];
      programs = {
        hyprlock = {
          enable = true;
        };
      };
      services = {
        cliphist = {
          enable = true;
        };
        hypridle = {
          enable = true;
          settings = {
            general = {
              after_sleep_cmd = "hyprctl dispatch dpms on";
              ignore_dbus_inhibit = false;
              lock_cmd = "hyprlock";
            };

            listener = [
              {
                timeout = 900;
                on-timeout = "hyprlock";
              }
              {
                timeout = 1200;
                on-timeout = "hyprctl dispatch dpms off";
                on-resume = "hyprctl dispatch dpms on";
              }
            ];
          };
        };
        hyprpaper = {
          enable = true;
          settings = {
            ipc = "on";
            splash = false;
            splash_offset = 2.0;

            preload = [ "/home/fw/nix/wallpapers/blue.png" ];

            wallpaper = [
              "DP-1,/home/fw/nix/wallpapers/blue.png"
            ];
          };
        };
      };

      wayland.windowManager.hyprland = {
        enable = true;
        xwayland = {
          enable = true;
        };

        settings = {
          "$terminal" = "kitty";
          "$mod" = "ALT";

          monitor = [
            "desc: ASUSTek COMPUTER INC ASUS PA279CV S4LMTF159462 (DP-1), 3840x2160@60, 0x0, 1.5"
            "desc: ASUSTek COMPUTER INC VG279 JBLMQS021792 (DP-1), 1920x1080@144, 0x0, 1"
            ",prefered,auto,1"
          ];

          xwayland = {
            force_zero_scaling = true;
          };

          general = {
            gaps_in = 15;
            gaps_out = 15;
            border_size = 2;
            layout = "dwindle";
            allow_tearing = true;
          };

          input = {
            kb_layout = "se";
            kb_options = [
              "caps:escape"
            ];

            follow_mouse = true;
            touchpad = {
              natural_scroll = true;
            };
            accel_profile = "flat";
            sensitivity = 0;
          };

          decoration = {
            rounding = 0;
            active_opacity = 0.9;
            inactive_opacity = 0.8;
            fullscreen_opacity = 0.9;

            blur = {
              enabled = true;
              xray = true;
              special = false;
              new_optimizations = true;
              size = 14;
              passes = 4;
              brightness = 1;
              noise = 0.01;
              contrast = 1;
              popups = true;
              popups_ignorealpha = 0.6;
              ignore_opacity = false;
            };
          };

          animations = {
            enabled = true;
            bezier = [
              "linear, 0, 0, 1, 1"
              "md3_standard, 0.2, 0, 0, 1"
              "md3_decel, 0.05, 0.7, 0.1, 1"
              "md3_accel, 0.3, 0, 0.8, 0.15"
              "overshot, 0.05, 0.9, 0.1, 1.1"
              "crazyshot, 0.1, 1.5, 0.76, 0.92"
              "hyprnostretch, 0.05, 0.9, 0.1, 1.0"
              "menu_decel, 0.1, 1, 0, 1"
              "menu_accel, 0.38, 0.04, 1, 0.07"
              "easeInOutCirc, 0.85, 0, 0.15, 1"
              "easeOutCirc, 0, 0.55, 0.45, 1"
              "easeOutExpo, 0.16, 1, 0.3, 1"
              "softAcDecel, 0.26, 0.26, 0.15, 1"
              "md2, 0.4, 0, 0.2, 1"
            ];
            animation = [
              "windows, 1, 1, md3_decel, popin 60%"
              "windowsIn, 1, 1, md3_decel, popin 60%"
              "windowsOut, 1, 1, md3_accel, popin 60%"
              "border, 1, 2, default"
              "fade, 1, 1, md3_decel"
              "layersIn, 1, 1, menu_decel, slide"
              "layersOut, 1, 1, menu_accel"
              "fadeLayersIn, 1, 1, menu_decel"
              "fadeLayersOut, 1, 1, menu_accel"
              "workspaces, 1, 2, menu_decel, slide"
              "specialWorkspace, 1, 1, md3_decel, slidevert"
            ];
          };

          cursor = {
            enable_hyprcursor = true;
          };

          dwindle = {
            pseudotile = true;
            preserve_split = true;
            smart_split = false;
            smart_resizing = false;
          };

          misc = {
            disable_hyprland_logo = true;
            disable_splash_rendering = true;
			enable_swallow = true;
			swallow_regex = "^(kitty)$";
          };

          bind = [
            # General
            "$mod, return, exec, $terminal"
            "$mod SHIFT, q, killactive"
            "$mod SHIFT, e, exit"
            "$mod SHIFT, d, exec, /home/fw/scripts/dmenu_sys"
            "$mod SHIFT, x, exec, ${pkgs.hyprlock}/bin/hyprlock"

            # Screen focus
            "$mod, v, togglefloating"
            "$mod, u, focusurgentorlast"
            "$mod, tab, focuscurrentorlast"
            "$mod, f, fullscreen"

            # Screen resize
            "$mod CTRL, h, resizeactive, -20 0"
            "$mod CTRL, l, resizeactive, 20 0"
            "$mod CTRL, k, resizeactive, 0 -20"
            "$mod CTRL, j, resizeactive, 0 20"

            # Workspaces
            "$mod, 1, workspace, 1"
            "$mod, 2, workspace, 2"
            "$mod, 3, workspace, 3"
            "$mod, 4, workspace, 4"
            "$mod, 5, workspace, 5"
            "$mod, 6, workspace, 6"
            "$mod, 7, workspace, 7"
            "$mod, 8, workspace, 8"
            "$mod, 9, workspace, 9"
            "$mod, 0, workspace, 10"

            # Move to workspaces
            "$mod SHIFT, 1, movetoworkspace,1"
            "$mod SHIFT, 2, movetoworkspace,2"
            "$mod SHIFT, 3, movetoworkspace,3"
            "$mod SHIFT, 4, movetoworkspace,4"
            "$mod SHIFT, 5, movetoworkspace,5"
            "$mod SHIFT, 6, movetoworkspace,6"
            "$mod SHIFT, 7, movetoworkspace,7"
            "$mod SHIFT, 8, movetoworkspace,8"
            "$mod SHIFT, 9, movetoworkspace,9"
            "$mod SHIFT, 0, movetoworkspace,10"

            # Navigation
            "$mod, h, movefocus, l"
            "$mod, l, movefocus, r"
            "$mod, k, movefocus, u"
            "$mod, j, movefocus, d"

            # Applications
            "$mod, q, exec, ${pkgs.firefox}/bin/firefox"
            "$mod, d, exec, ${pkgs.rofi}/bin/rofi -show run"

            # Screencapture
            "$mod, S, exec, ${pkgs.grim}/bin/grim | wl-copy"
            "$mod SHIFT+ALT, S, exec, ${pkgs.grim}/bin/grim -g \"$(slurp)\" - | ${pkgs.swappy}/bin/swappy -f -"
          ];

          bindm = [
            "$mod, mouse:272, movewindow"
            "$mod, mouse:273, resizewindow"
          ];

          env = [
            "NIXOS_OZONE_WL,1"
            "_JAVA_AWT_WM_NONREPARENTING,1"
            "QT_WAYLAND_DISABLE_WINDOWDECORATION,1"
            "QT_QPA_PLATFORM,wayland"
            "SDL_VIDEODRIVER,wayland"
            "GDK_BACKEND,wayland"
            "XDG_SESSION_TYPE,wayland"
            "XDG_SESSION_DESKTOP,Hyprland"
            "XDG_CURRENT_DESKTOP,Hyprland"
          ];
        };
        systemd = {
          enable = true;
        };
      };
    };
}
