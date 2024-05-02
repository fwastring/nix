{ pkgs, lib, ... }:
{
	programs.fish = {
		enable = true;
		plugins = [
		   {
			 name = "z";
			 src = pkgs.fetchFromGitHub {
			   owner = "jethrokuan";
			   repo = "z";
			   rev = "e0e1b9dfdba362f8ab1ae8c1afc7ccf62b89f7eb";
			   sha256 = "0dbnir6jbwjpjalz14snzd3cgdysgcs3raznsijd6savad3qhijc";
			 };
		   }
		   { 
		   	name = "grc"; 
			src = pkgs.fishPlugins.grc.src; 
			}
	  ];
	  shellAbbrs = {
		  homec="nvim ~/nix/config/home.nix";
		  ls="exa -lag --header";
	  };
	  interactiveShellInit = ''
		${pkgs.any-nix-shell}/bin/any-nix-shell fish --info-right | source
	  '';
	};
}
