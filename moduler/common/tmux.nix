{ lib, config, pkgs, fetchFromGitHub, ... }:
{
  programs.tmux = {
    enable = true;
    mouse = true;
    plugins = with pkgs; [
		tmuxPlugins.sensible
		tmuxPlugins.pain-control
		tmuxPlugins.sessionist
		{
			plugin = fw-pkgs.tmuxPlugins.dracula;
			extraConfig = ''
				set -g @dracula-show-powerline true
				# available plugins: battery, cpu-usage, git, gpu-usage, ram-usage, tmux-ram-usage, network, network-bandwidth, network-ping, ssh-session, attached-clients, network-vpn, weather, time, mpc, spotify-tui, playerctl, kubernetes-context, synchronize-panes
				set -g @dracula-plugins 'spotify-tui battery time'
				# set -g @dracula-plugins 'battery time'
				set -g @dracula-refresh-rate 10
				set -g @dracula-show-timezone false
				set -g @dracula-military-time true
				set -g @dracula-day-month true
				set -g @dracula-show-left-icon session
				set -g @dracula-battery-label ""
				set -g @dracula-battery-colors "cyan dark_gray"
				set -g @dracula-spotify-tui-colors "pink dark_gray"
				set -g @dracula-ssh-session-colors "orange dark_gray"
				set -g @dracula-show-empty-plugins false
			'';
		}
    ];
    prefix = "C-a";
    terminal = "xterm-256color";
    keyMode = "vi";
	escapeTime = 0;
    extraConfig = "

    ";
  };
}
