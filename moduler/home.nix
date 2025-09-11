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
		../moduler/oh-my-posh.nix
		../moduler/gtk.nix
		# ../moduler/neovim.nix
		../moduler/k9s
	  ];

	  programs.home-manager.enable = true;
	  programs.fish.enable = true;

	  home.username = "fw";
	  home.homeDirectory = "/home/fw";

	  home.stateVersion = "25.05";

	  systemd.user.startServices = "sd-switch";
}
