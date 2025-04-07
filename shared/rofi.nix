{ config, pkgs, lib, ... }:
{
	programs.rofi = {
		enable = true;
		# theme = 
		# let
		#   inherit (config.lib.formats.rasi) mkLiteral;
		# in {
		#   "*" = {
		# 	bg-col = mkLiteral "#1e1e2e";
		# 	bg-col-light = mkLiteral "#1e1e2e";
		# 	border-col = mkLiteral "#1e1e2e";
		# 	selected-col = mkLiteral "#1e1e2e";
		# 	blue = mkLiteral "#89b4fa";
		# 	fg-col = mkLiteral "#cdd6f4";
		# 	fg-col2 = mkLiteral "#f38ba8";
		# 	grey = mkLiteral "#6c7086";
		#   };
		#
		#   "element-text, element-icon, mode-switcher" = {  # Combine selectors
		# 	background-color = mkLiteral "inherit";
		# 	text-color = mkLiteral "inherit";
		#   };
		#
		#   "#window" = {  # Use # for IDs
		# 	height = mkLiteral "360px"; # Important: Use mkLiteral for dimensions and units
		# 	border = mkLiteral "3px";  # Important: Use mkLiteral for dimensions and units
		# 	border-color = mkLiteral "@border-col";
		# 	background-color = mkLiteral "@bg-col";
		#   };
		#
		#   "#mainbox" = {
		# 	background-color = mkLiteral "@bg-col";
		#   };
		#
		#   "#inputbar" = {
		# 	children = map mkLiteral ["prompt" "entry"];
		# 	background-color = mkLiteral "@bg-col";
		# 	border-radius = mkLiteral "5px";  # Important: Use mkLiteral for dimensions and units
		# 	padding = mkLiteral "2px";  # Important: Use mkLiteral for dimensions and units
		#   };
		#
		#   "#prompt" = {
		# 	background-color = mkLiteral "@blue";
		# 	padding = mkLiteral "6px";  # Important: Use mkLiteral for dimensions and units
		# 	text-color = mkLiteral "@bg-col";
		# 	border-radius = mkLiteral "3px";  # Important: Use mkLiteral for dimensions and units
		# 	margin = mkLiteral "20px 0px 0px 20px"; # Important: Use mkLiteral for dimensions and units
		#   };
		#
		#   "#textbox-prompt-colon" = {
		# 	expand = false;
		# 	str = mkLiteral ":";
		#   };
		#
		#   "#entry" = {
		# 	padding = mkLiteral "6px";  # Important: Use mkLiteral for dimensions and units
		# 	margin = mkLiteral "20px 0px 0px 10px"; # Important: Use mkLiteral for dimensions and units
		# 	text-color = mkLiteral "@fg-col";
		# 	background-color = mkLiteral "@bg-col";
		#   };
		#
		#   "#listview" = {
		# 	border = mkLiteral "0px 0px 0px"; # Important: Use mkLiteral for dimensions and units
		# 	padding = mkLiteral "6px 0px 0px"; # Important: Use mkLiteral for dimensions and units
		# 	margin = mkLiteral "10px 0px 0px 20px"; # Important: Use mkLiteral for dimensions and units
		# 	columns = mkLiteral "2"; # Important: Use mkLiteral for dimensions and units
		# 	lines = mkLiteral "5"; # Important: Use mkLiteral for dimensions and units
		# 	background-color = mkLiteral "@bg-col";
		#   };
		#
		#   "#element" = {
		# 	padding = mkLiteral "5px";  # Important: Use mkLiteral for dimensions and units
		# 	background-color = mkLiteral "@bg-col";
		# 	text-color = mkLiteral "@fg-col";
		#   };
		#
		#   "#element-icon" = {
		# 	size = mkLiteral "25px";  # Important: Use mkLiteral for dimensions and units
		#   };
		#
		#   "element.selected" = {  # Use . for classes
		# 	background-color = mkLiteral "@selected-col";
		# 	text-color = mkLiteral "@fg-col2";
		#   };
		#
		#   "#mode-switcher" = {
		# 	spacing = mkLiteral "0";
		#   };
		#
		#   "#button" = {
		# 	padding = mkLiteral "10px";  # Important: Use mkLiteral for dimensions and units
		# 	background-color = mkLiteral "@bg-col-light";
		# 	text-color = mkLiteral "@grey";
		# 	vertical-align = mkLiteral "0.5";
		# 	horizontal-align = mkLiteral "0.5";
		#   };
		#
		#   "button.selected" = {  # Use . for classes
		# 	background-color = mkLiteral "@bg-col";
		# 	text-color = mkLiteral "@blue";
		#   };
		#
		#   "#message" = {
		# 	background-color = mkLiteral "@bg-col-light";
		# 	margin = mkLiteral "2px";  # Important: Use mkLiteral for dimensions and units
		# 	padding = mkLiteral "2px";  # Important: Use mkLiteral for dimensions and units
		# 	border-radius = mkLiteral "5px";  # Important: Use mkLiteral for dimensions and units
		#   };
		#
		#   "#textbox" = {
		# 	padding = mkLiteral "6px";  # Important: Use mkLiteral for dimensions and units
		# 	margin = mkLiteral "20px 0px 0px 20px"; # Important: Use mkLiteral for dimensions and units
		# 	text-color = mkLiteral "@blue";
		# 	background-color = mkLiteral "@bg-col-light";
		#   };
		# };
	};
}
