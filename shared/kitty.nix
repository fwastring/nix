{ pkgs, lib, myhostname, ... }:
{
  programs.kitty = {
    enable = true;
    font = if myhostname == "laptop" then {
      # name = "Iosevka Nerd Font Bold";
      # name = "ComicShannsMono Nerd Font Bold";
      name = "Hack Nerd Font Mono Bold";
      size = 15;
    } else {
      # name = "Iosevka Nerd Font Bold";
      # name = "ComicShannsMono Nerd Font Bold";
      name = "Hack Nerd Font Mono Bold";
      size = 13;
    };
    shellIntegration = {
      mode = "no-cursor";
    };
    theme = "Catppuccin-Mocha";
    settings = {
      confirm_os_window_close = 2;
      cursor_shape = "block";
      cursor_blink_interval = 0;
      enable_audio_bell = false;
    };
  };
}
