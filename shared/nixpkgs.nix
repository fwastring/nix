{ pkgs, lib, ... }:
{
  nixpkgs = {
    # Configure your nixpkgs instance
    config = {
      allowUnfree = true;
      permittedInsecurePackages = [
        "electron-33.4.11"
      ];
    };
  };
}
