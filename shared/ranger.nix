{ pkgs, lib, ... }:
{
  programs.firefox = {
    enable = true;
	extraConfig = ''
		set colorscheme dracula
	'';
  };
}
