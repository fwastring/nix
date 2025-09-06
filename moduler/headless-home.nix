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
    ../shared/tmux.nix
    ../shared/fish.nix
    ../shared/git.nix
    ../shared/nixpkgs.nix
    ../shared/lazygit.nix
    ../shared/ssh.nix
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

  home.username = "fw";
  home.homeDirectory = "/home/fw";

  home.stateVersion = "25.05"; # Did you read the comment?

  systemd.user.startServices = "sd-switch";
}
