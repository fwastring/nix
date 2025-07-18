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
        name = "grc";
        src = pkgs.fishPlugins.grc.src;
      }
    ];
    shellAbbrs = {
      ls = "eza -l --no-time --no-permissions --no-user";
      k = "kubectl";
      ka = "kubectl apply -f";
      e = "nvim";
      t = "timew";
      cam = "jira issue create && jira issue assign && jira issue move";
      latest = "git log | head -1 | awk '{print $2;}' | xsel -ib";
      vpnup = "nmcli con up 'iFacts VPN'";
      s = {
		  setCursor = "%";
		  expansion = "cha https://search.wastring.com/search?q=%";
	  };
      vpndown = {
		  setCursor = "%";
		  expansion = "nmcli con down 'iFacts VPN'";
	  };
	  dl = {
	  	setCursor = "&";
		expansion = "yt-dlp -o \"~/videor/%(title)s - %(uploader)s\" \"&\"";
	};
    };
    interactiveShellInit = ''
      		fish_vi_key_bindings
      		set fish_greeting # Disable greeting
      		set FLAKE_DIR "/home/fw/nix"
      		set HM_DIR "$FLAKE_DIR#fw@jobb"
      		set SYSTEM_DIR "$FLAKE_DIR#jobb"
      		set -Ux FZF_CTRL_R_OPTS "--reverse"
      		set -Ux FZF_TMUX_OPTS "-p"
      		set -e GOROOT
      		set -e GOPATH

      		# Mocha
      		set -Ux FZF_DEFAULT_OPTS "\
      		--color=bg+:#313244,bg:#1e1e2e,spinner:#f5e0dc,hl:#f38ba8 \
      		--color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc \
      		--color=marker:#b4befe,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8 \
      		--color=selected-bg:#45475a \
      		--multi"
      	  '';
  };
}
