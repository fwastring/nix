{ config, inputs, pkgs, ... }:

let
in
{
  # Enable the Home Manager Neovim module if you haven't already
  # programs.neovim.enable = true;

  # Create a symlink from the Nix store to the Neovim config directory
  xdg.configFile."nvim".source = inputs.nvim-config;

  # Other Home Manager options...
}
