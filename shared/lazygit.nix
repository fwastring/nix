
{ pkgs, lib, ... }:
{
  programs.lazygit = {
		enable = true;
		settings = {
		  gui = {
		  	# Mocha
			 #  theme = {
				#   activeBorderColor = [ "#f5a97f" "bold" ];
				#   inactiveBorderColor = [ "#a5adcb" ];
				#   optionsTextColor = [ "#8aadf4" ];
				#   selectedLineBgColor = [ "#363a4f" ];
				#   cherryPickedCommitBgColor = [ "#494d64" ];
				#   cherryPickedCommitFgColor = [ "#f5a97f" ];
				#   unstagedChangesColor = [ "#ed8796" ];
				#   defaultFgColor = [ "#cad3f5" ];
				#   searchingActiveBorderColor = [ "#eed49f" ];
				# };
				#
				# authorColors = {
				#   "*" = "#b7bdf8";
				# };
			# Latte
			theme = {
				 activeBorderColor = [ "#fe640b" "bold" ];
				 inactiveBorderColor = [ "#6c6f85" ];
				 optionsTextColor = [ "#1e66f5" ];
				 selectedLineBgColor = [ "#ccd0da" ];
				 cherryPickedCommitBgColor = [ "#bcc0cc" ];
				 cherryPickedCommitFgColor = [ "#fe640b" ];
				 unstagedChangesColor = [ "#d20f39" ];
				 defaultFgColor = [ "#4c4f69" ];
				 searchingActiveBorderColor = [ "#df8e1d" ];
			   };

			   authorColors = {
				 "*" = "#7287fd";
			   };
			showRandomTip = false;
			showBottomLine = false;
			sidePanelWidth = 0.5;
		  };
	  };
  };
}
