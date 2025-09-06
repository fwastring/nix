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
		../shared/dwm.nix
		../shared/tmux.nix
		../shared/fish.nix
		../shared/git.nix
		../shared/kitty.nix
		../shared/dunst.nix
		../shared/nixpkgs.nix
		../shared/firefox.nix
		../shared/zathura.nix
		../shared/lazygit.nix
		../shared/ssh.nix
		../shared/aerc.nix
		../shared/oh-my-posh.nix
		../shared/gtk.nix
		../shared/neovim.nix
		../shared/k9s.nix
	  ];

	  programs.home-manager.enable = true;
	  programs.fish.enable = true;
	  programs.man.generateCaches = false;


	  home.username = "fw";
	  home.homeDirectory = "/home/fw";

	  home.stateVersion = "25.05"; # Did you read the comment?

	  systemd.user.startServices = "sd-switch";
}
