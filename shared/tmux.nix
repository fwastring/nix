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
      		set -g default-terminal "xterm-kitty"                                                                    
      		set -g terminal-overrides "xterm-kitty"                                                                                             
      		# true colours support                                                                                                              
      		# set -ga terminal-overrides ",*256col*:Tc"                                                                              
      		set -ga terminal-overrides ",xterm-256color:Tc"                                                                         
      		set -as terminal-overrides ',*:Smulx=\E[4::%p1%dm'                                                   
      		# underscore colours - needs tmux-3.0                                                                                               
      		set -as terminal-overrides ',*:Setulc=\E[58::2::%p1%{65536}%/%d::%p1%{256}%/%{255}%&%d::%p1%{255}%&%d%;m'
    '';
  };
}
