{ pkgs, ... }:
{
  programs.tmux = {
    enable = true;
    mouse = true;
    plugins = with pkgs; [
		tmuxPlugins.sensible
		tmuxPlugins.pain-control
		tmuxPlugins.sessionist
		tmuxPlugins.logging
		{
			plugin = tmuxPlugins.resurrect;
			extraConfig = ''
				resurrect_dir="$HOME/.tmux/resurrect"
				set -g @resurrect-dir $resurrect_dir
				set -g @resurrect-hook-post-save-all 'target=$(readlink -f $resurrect_dir/last); sed "s| --cmd .*-vim-pack-dir||g; s|/etc/profiles/per-user/$USER/bin/||g" $target | sponge $target'
				set -g @resurrect-strategy-nvim 'session'
			'';
		}
		{
			plugin = tmuxPlugins.continuum;
			extraConfig = ''
				set -g @continuum-boot 'on'
				set -g @continuum-restore 'on'
			'';
		}
		fw-pkgs.tmuxPlugins.spotify
		{
			plugin = fw-pkgs.tmuxPlugins.minimal;
			extraConfig = ''
				bind-key b set-option status
			'';
		}
		
    ];
    prefix = "C-a";
    terminal = "alacritty";
    keyMode = "vi";
	escapeTime = 0;
    extraConfig = ''
		set -g base-index 1
		setw -g pane-base-index 1
		set-option -ga terminal-overrides ",alacritty:Tc"
    '';
  };
}
