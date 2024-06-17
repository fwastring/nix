{ pkgs, ... }:
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
			 name = "autopair";
			 src = pkgs.fishPlugins.autopair.src;
		   }
		   {
			 name = "foreign-env";
			 src = pkgs.fishPlugins.foreign-env.src;
		   }
		   {
		   	 name = "fzf";
			 src = pkgs.fishPlugins.fzf.src;
		   }
		   {
		   	 name = "done";
			 src = pkgs.fishPlugins.done.src;
		   }
		   {
		   	 name = "sponge";
			 src = pkgs.fishPlugins.sponge.src;
		   }
		   { 
			 name = "grc"; 
			 src = pkgs.fishPlugins.grc.src; 
		   }
	  ];
	  shellAbbrs = {
		  homec="nvim ~/nix/config/home.nix";
		  ls="exa -lag --header";
		  dev="nix develop --command fish";
		  spot="steam-run ~/program/spotify_player";
		  sc="sc-im";
	  };
	  interactiveShellInit = ''
		set fish_greeting # Disable greeting
		set -Ux FZF_DEFAULT_OPTS "--color=fg:#f8f8f2,bg:#282a36,hl:#bd93f9 --color=fg+:#f8f8f2,bg+:#44475a,hl+:#bd93f9 --color=info:#ffb86c,prompt:#50fa7b,pointer:#ff79c6 --color=marker:#ff79c6,spinner:#ffb86c,header:#6272a4"
	  '';
	};
}
