# This is your system's configuration file.
# Use this to configure your system environment (it replaces /etc/nixos/configuration.nix)
{
  inputs,
  lib,
  config,
  pkgs,
  myhostname,
  ...
}:
{

  environment.systemPackages = with pkgs; [
    nixd
    gopls
    omnisharp-roslyn
    nodePackages.vscode-json-languageserver
    tailwindcss-language-server
    dockerfile-language-server
    nodejs_22
    bash-language-server
    helm-ls
    yaml-language-server
    vue-language-server
    vtsls
    typescript
    typescript-language-server
    lua-language-server
    marksman
  ];
}
