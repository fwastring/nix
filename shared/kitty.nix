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
          # name = "Iosevka Nerd Font Bold";
          name = "ComicShannsMono Nerd Font Bold";
          # name = "Hack Nerd Font Mono Bold";
          size = 17;
        }
      else
        {
          # name = "Iosevka Nerd Font Bold";
          name = "ComicShannsMono Nerd Font Bold";
          # name = "Hack Nerd Font Mono Bold";
          size = 12;
        };
    shellIntegration = {
      mode = "no-cursor";
    };
    # themeFile = "Catppuccin-Mocha";
    # themeFile = "Catppuccin-Latte";
    themeFile = "Solarized_Light";
    # themeFile = "rose-pine-dawn";
    # themeFile = "Belafonte_Day";
    settings = {
      confirm_os_window_close = 2;
      cursor_shape = "block";
      cursor_blink_interval = 0;
      enable_audio_bell = false;
    };
  };
}
