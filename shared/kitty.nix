{
  pkgs,
  lib,
  myhostname,
  ...
}:
{
  programs.kitty = {
    enable = true;
    font =
        {
          name = "ComicShannsMono Nerd Font";
          size = 22;
        };
    shellIntegration = {
      mode = "no-cursor";
    };
    themeFile = "Catppuccin-Latte";
    settings = {
      confirm_os_window_close = 2;
      cursor_shape = "block";
      cursor_blink_interval = 0;
      enable_audio_bell = false;
    };
  };
}
