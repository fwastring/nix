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
    enable = true;
	settings = {
		k9s.ui.skin = "catppuccin-latte";
	};
	skins = {
		catppuccin-latte = ./latte-transparent.yml;
	};
  };
}
