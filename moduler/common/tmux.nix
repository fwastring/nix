{ pkgs, lib, ... }:
{
  programs.tmux = {
    enable = true;
    mouse = true;
    plugins = with pkgs; [
		tmuxPlugins.sensible
		tmuxPlugins.tmux-fzf
		tmuxPlugins.pain-control
		tmuxPlugins.sessionist
		# tmuxPlugins.catppuccin
		# tmuxPlugins.weather
		tmuxPlugins.resurrect
		tmuxPlugins.continuum
    ];
    prefix = "C-a";
    terminal = "xterm-256color";
    keyMode = "vi";
	escapeTime = 0;
    extraConfig = "
		set -g @catppuccin_flavour 'macchiato'
		set -g @catppuccin_window_left_separator '█'
		set -g @catppuccin_window_right_separator '█ '
		set -g @catppuccin_window_number_position 'right'
		set -g @catppuccin_window_middle_separator '  █'

		set -g @catppuccin_window_default_fill 'number'

		set -g @catppuccin_window_current_fill 'number'
		set -g @catppuccin_window_current_text '#{pane_current_path}'

		set -g @catppuccin_status_left_separator  ''
		set -g @catppuccin_status_right_separator ' '
		set -g @catppuccin_status_fill 'all'
		set -g @catppuccin_status_connect_separator 'yes'
		run-shell ${pkgs.tmuxPlugins.catppuccin}/share/tmux-plugins/catppuccin/catppuccin.tmux
		run-shell ${pkgs.tmuxPlugins.weather}/share/tmux-plugins/weather/weather.tmux
		set -g @catppuccin_status_modules_right 'date_time weather'
		set -g @catppuccin_window_number_position 'right'
		set -g @continuum-boot 'on'
		set -g @continuum-restore 'on'
		set -g @resurrect-strategy-nvim 'session'
		set -g @resurrect-capture-pane-contents 'on'
		set -g @resurrect-processes 'nvim'
    ";
  };
}
