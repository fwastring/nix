{ pkgs, lib, ... }:
{
  programs.zathura = {
    enable = true;
    options = {
      selection-clipboard = "clipboard";
	  font = "FiraCodeNerdFont Normal 12";
    };
	extraConfig = ''
		include catppuccin-latte
	'';
  };
}
