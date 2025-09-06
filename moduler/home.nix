{
  inputs,
  lib,
  config,
  pkgs,
  myhostname,
  ...
}:
{
	  imports = [
		../moduler/tmux.nix
		../moduler/fish.nix
		../moduler/git.nix
		../moduler/kitty.nix
		../moduler/dunst.nix
		../moduler/nixpkgs.nix
		../moduler/firefox.nix
		../moduler/zathura.nix
		../moduler/lazygit.nix
		../moduler/ssh.nix
		../moduler/aerc.nix
		../moduler/oh-my-posh.nix
		../moduler/gtk.nix
		# ../moduler/neovim.nix
		../moduler/k9s.nix
	  ];

	  programs.home-manager.enable = true;
	  programs.fish.enable = true;
	  programs.man.generateCaches = false;

	  home.username = "fw";
	  home.homeDirectory = "/home/fw";

	  home.stateVersion = "25.05";

	  systemd.user.startServices = "sd-switch";
}
