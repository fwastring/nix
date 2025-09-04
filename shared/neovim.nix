{ config, pkgs, ... }:

let
  # Replace with the URL of your Neovim configuration GitHub repository
	nvim-config = {
      url = "github:fwastring/nvim?exportIgnore=1";
      # Use a specific, locked commit hash here
      # You can get this by running 'nix flake lock'
      # after adding the input
      flake = false; # Tell Nix this is not a flake
    };

in
{
  # Enable the Home Manager Neovim module if you haven't already
  # programs.neovim.enable = true;

  # Create a symlink from the Nix store to the Neovim config directory
  xdg.configFile."nvim".source = nvim-config;

  # Other Home Manager options...
}
