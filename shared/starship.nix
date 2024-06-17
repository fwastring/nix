# This file is generated from "README.org"
{ pkgs, ... }:
{
	programs.starship =
		let
		  flavour = "macchiato"; # One of `latte`, `frappe`, `macchiato`, or `mocha`
		in
		{
		  enable = true;
		  enableFishIntegration = true;
		  settings = {
			# Other config here
			# format = "$all"; # Remove this line to disable the default prompt format
			palette = "catppuccin_${flavour}";
			nix_shell = {
			  disabled = false;
			  symbol = " ";
			};
		  } // builtins.fromTOML (builtins.readFile
			(pkgs.fetchFromGitHub
			  {
				owner = "catppuccin";
				repo = "starship";
				rev = "5629d2356f62a9f2f8efad3ff37476c19969bd4f"; # Replace with the latest commit hash
				sha256 = "sha256-nsRuxQFKbQkyEI4TXgvAjcroVdG+heKX5Pauq/4Ota0=";
			  } + /palettes/${flavour}.toml));
		};
	# programs.starship = {
	# 	enable = true;
	# 	enableFishIntegration = true;
	# 	package = pkgs.starship;
	# 	settings = {
	# 		# Other config here
	# 		format = "$all"; # Remove this line to disable the default prompt format
	# 		palette = "catppuccin_macchiato";
	# 		add_newline = true;
	# 		character = {
	# 		  success_symbol = "[𝝺](#c792ea)";
	# 		  vicmd_symbol = "[ ](bold green)";
	# 		  error_symbol = "[☓ ](bold red)";
	# 		};
	# 		directory = {
	# 		  style = "bold cyan";
	# 		};
	# 		nix_shell = {
	# 		  disabled = false;
	# 		  symbol = " ";
	# 		};
	# 	  } // builtins.fromTOML (builtins.readFile
	# 		(pkgs.fetchFromGitHub
	# 		  {
	# 			owner = "catppuccin";
	# 			repo = "starship";
	# 			rev = ""; # Replace with the latest commit hash
	# 			sha256 = "";
	# 		  } + /palettes/macchiato.toml));
	# 	};
	# }
}
