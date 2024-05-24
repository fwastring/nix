{ lib, config, pkgs, fetchFromGitHub, ... }:
{
  programs.tmux = {
    enable = true;
    mouse = true;
    plugins = with pkgs; [
		tmuxPlugins.sensible
		# tmuxPlugins.tmux-fzf
		tmuxPlugins.pain-control
		fw-pkgs.tmuxPlugins.spotify
		tmuxPlugins.sessionist
		{
			plugin = fw-pkgs.tmuxPlugins.dracula;
			extraConfig = ''
				set -g @dracula-show-battery false
				set -g @dracula-show-powerline true
				# available plugins: battery, cpu-usage, git, gpu-usage, ram-usage, tmux-ram-usage, network, network-bandwidth, network-ping, ssh-session, attached-clients, network-vpn, weather, time, mpc, spotify-tui, playerctl, kubernetes-context, synchronize-panes
				set -g @dracula-plugins 'git time'
				set -g @dracula-refresh-rate 10
				set -g @dracula-show-timezone false
				set -g @dracula-military-time true
				set -g @dracula-day-month true
				set -g @dracula-show-left-icon session
			'';
		}
		tmuxPlugins.resurrect
		tmuxPlugins.continuum
    ];
    prefix = "C-a";
    terminal = "xterm-256color";
    keyMode = "vi";
	escapeTime = 0;
    extraConfig = "

    ";
  };
}
