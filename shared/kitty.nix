{ pkgs, lib, myhostname, ... }:
{
  programs.kitty = {
    enable = true;
    font = if myhostname == "laptop" then {
      name = "FiraCode Nerd Font Bold";
      size = 17;
    } else {
      name = "FiraCode Nerd Font Bold";
      size = 13;
    };
    shellIntegration = {
      mode = "no-cursor";
    };
    # theme = "Catppuccin-Latte";
    theme = "Catppuccin-Macchiato";
    settings = {
      confirm_os_window_close = 2;
      cursor_shape = "block";
      cursor_blink_interval = 0;
      enable_audio_bell = false;
    };
  };
}
