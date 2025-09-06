{ pkgs, lib, ... }:
{
  programs.firefox = {
    enable = true;
    profiles.default = {
      isDefault = true;
    };
  };
}
