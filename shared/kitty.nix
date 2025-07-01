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
          name = "ComicShannsMono Nerd Font";
          # name = "Hack Nerd Font Mono Bold";
          size = 18;
        }
      else
        {
          # name = "Iosevka Nerd Font Bold";
          name = "ComicShannsMono Nerd Font";
          # name = "Hack Nerd Font Mono Bold";
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
	keybindings = {
		"ctrl+alt+k" = "launch --location=hsplit --cwd=current";
		"ctrl+alt+l" = "launch --location=vsplit --cwd=current";
		"ctrl+shift+n" = "next_tab";
		"ctrl+shift+b" = "prev_tab";
		"ctrl+h" = "neighboring_window left";
		"ctrl+l" = "neighboring_window right";
		"ctrl+j" = "neighboring_window down";
		"ctrl+k" = "neighboring_window up";
	};
  };
}
