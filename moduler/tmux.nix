{ pkgs, ... }:
{
  programs.tmux = {
    enable = true;
    mouse = true;
    prefix = "C-a";
    terminal = "st";
    keyMode = "vi";
    escapeTime = 0;
	baseIndex = 1;
    plugins = with pkgs; [
      tmuxPlugins.sensible
      tmuxPlugins.pain-control
      tmuxPlugins.sessionist
      {
        plugin = fw-pkgs.tmuxPlugins.minimal;
        extraConfig = ''
			bind-key b set-option status
		'';
      }

    ];
    extraConfig = ''
			set -g set-clipboard on

			set -g base-index 1
			set-window-option -g pane-base-index 1

			set-window-option -g mode-keys vi

			bind-key -T copy-mode-vi v send-keys -X begin-selection
			bind -T copy-mode-vi y send-keys -X copy-pipe-and-cancel 'xclip -in -selection clipboard'
			bind -T copy-mode-vi MouseDragEnd1Pane send-keys -X copy-pipe-and-cancel "xclip -i -f -selection primary | xclip -i -selection clipboard"

      		set -g default-terminal "st-256color"                                                                    
      		set -g terminal-overrides "st-256color"                                                                                             
			# set -g default-terminal "xterm-kitty"                                                                    
      		# set -g terminal-overrides "xterm-kitty"

      		set -ga terminal-overrides ",xterm-256color:Tc"                                                                         
      		set -as terminal-overrides ',*:Smulx=\E[4::%p1%dm'                                                   
      		set -as terminal-overrides ',*:Setulc=\E[58::2::%p1%{65536}%/%d::%p1%{256}%/%{255}%&%d::%p1%{255}%&%d%;m'
    '';
  };
}
