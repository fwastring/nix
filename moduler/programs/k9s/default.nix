{
  config,
  inputs,
  pkgs,
  ...
}:

let
in
{
  programs.k9s = {
    # enable = true;
    enable = false;
	settings = {
		k9s.ui.skin = "catppuccin-latte";
	};
	skins = {
		catppuccin-latte = ./latte-transparent.yml;
	};
  };
}
