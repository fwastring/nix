{ pkgs, lib, myhostname, ... }:
{
  programs.kitty = {
    enable = true;
    font = if myhostname == "laptop" then {
      name = "FiraCode Nerd Font Bold";
      size = 18;
    } else {
      name = "FiraCode Nerd Font Bold";
      size = 16;
    };
    shellIntegration = {
      mode = "no-cursor";
    };
    theme = "Catppuccin-Macchiato";
    settings = {
      confirm_os_window_close = 2;
      cursor_shape = "block";
      cursor_blink_interval = 0;
      enable_audio_bell = false;
    };
  };
}
