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
      if myhostname == "laptop" then
        {
          name = "ComicShannsMono Nerd Font";
          size = 18;
        }
      else
        {
          name = "ComicShannsMono Nerd Font";
          size = 12;
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
