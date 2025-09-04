{ config, inputs, pkgs, ... }:

let
in
{
  programs.k9s.enable = true;

  xdg.configFile."k9s".source = inputs.k9s-config;

}
