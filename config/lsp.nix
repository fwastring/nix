# This is your system's configuration file.
# Use this to configure your system environment (it replaces /etc/nixos/configuration.nix)
{
  inputs,
  lib,
  config,
  pkgs,
  myhostname,
  ...
}: {

  	environment.systemPackages = with pkgs; [
		nixd
		gopls
		unstable.neovim
		omnisharp-roslyn
		nodePackages.vscode-json-languageserver
		tailwindcss-language-server
		dockerfile-language-server-nodejs
		nodejs_22
		bash-language-server
	];
}
