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
    ../shared/dunst.nix
    ../shared/nixpkgs.nix
    ../shared/firefox.nix
    ../shared/zathura.nix
    ../shared/lazygit.nix
    ../shared/ssh.nix
    ../shared/aerc.nix
    ../shared/oh-my-posh.nix
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
  xsession.windowManager.command =
    if myhostname == "laptop" then
      "/home/fw/nix/.xinitrc.laptop"
    else if myhostname == "jobb" then
      "/home/fw/nix/.xinitrc.jobb"
    else
      "/home/fw/nix/.xinitrc";

  home.username = "fw";
  home.homeDirectory = "/home/fw";

  home.stateVersion = "23.11"; # Did you read the comment?

  systemd.user.startServices = "sd-switch";
}
