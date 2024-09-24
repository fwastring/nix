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
		  ls="exa -l --no-time --no-permissions --no-user";
		  dev="nix develop --command fish";
		  spot="steam-run ~/program/spotify_player";
		  sc="sc-im";
		  e="nvim";
		  c="ssh";
		  home="home-manager switch --flake $HM_DIR";
		  reb="sudo nixos-rebuild switch --flake $SYSTEM_DIR";
		  cam="jira issue create && jira issue assign && jira issue move";
		  vpnup="sudo VPN_PROTOCOL=wireguard DISABLE_IPV6=yes DIP_TOKEN=no AUTOCONNECT=true PIA_PF=false PIA_DNS=true PIA_USER=p4558499 PIA_PASS=vUZA6Nfzci ~/program/manual-connections/run_setup.sh";
		  vpndown="wg-quick down pia";
	  };
	  interactiveShellInit = ''
		set fish_greeting # Disable greeting
		set FLAKE_DIR "/home/fw/nix"
		set HM_DIR "$FLAKE_DIR#fw@jobb"
		set SYSTEM_DIR "$FLAKE_DIR#jobb"
		set GOPRIVATE "github.com/iFacts"
		# Macchiato
		set -Ux FZF_DEFAULT_OPTS "--color=fg:#f8f8f2,bg:#282a36,hl:#bd93f9 --color=fg+:#f8f8f2,bg+:#44475a,hl+:#bd93f9 --color=info:#ffb86c,prompt:#50fa7b,pointer:#ff79c6 --color=marker:#ff79c6,spinner:#ffb86c,header:#6272a4"

		# Latte
# 		set -Ux FZF_DEFAULT_OPTS "\
# --color=bg+:#ccd0da,bg:#eff1f5,spinner:#dc8a78,hl:#d20f39 \
# --color=fg:#4c4f69,header:#d20f39,info:#8839ef,pointer:#dc8a78 \
# --color=marker:#dc8a78,fg+:#4c4f69,prompt:#8839ef,hl+:#d20f39"
		fish_add_path /home/fw/.cargo/bin
	  '';
	};
}
