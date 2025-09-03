# This is your home-manager configuration file
# Use this to configure your home environment (it replaces ~/.config/nixpkgs/home.nix)
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
  ];

  nixpkgs = {
    overlays = [ ];
    config = {
      allowUnfree = true;
      allowUnfreePredicate = _: true;
    };
  };

  programs.home-manager.enable = true;
  programs.fish.enable = true;
  programs.man.generateCaches = false;

  xsession.enable = true;
  xsession.windowManager.command = "xrandr --output eDP-1 --mode 1920x1080 --pos 0x1080 --rotate normal --output DP-1 --off --output HDMI-1 --primary --mode 3840x2160 --pos 1920x0 --rotate normal --output DP-2 --off --output HDMI-2 --off";

  home.username = "fw";
  home.homeDirectory = "/home/fw";

  home.stateVersion = "23.11"; # Did you read the comment?

  systemd.user.startServices = "sd-switch";
}
