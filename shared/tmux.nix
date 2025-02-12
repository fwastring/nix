{ pkgs, ... }:
{
  programs.tmux = {
    enable = true;
    mouse = true;
    plugins = with pkgs; [
		tmuxPlugins.sensible
		tmuxPlugins.pain-control
		tmuxPlugins.sessionist
		{
			plugin = tmuxPlugins.continuum;
			extraConfig = ''
				set -g @continuum-boot 'on'
				set -g @continuum-restore 'on'
			'';
		}
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
