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
		unstable.nixd
		gopls
		inputs.neovim-nightly-overlay.packages.${pkgs.system}.default
		omnisharp-roslyn
		nodePackages.vscode-json-languageserver
		tailwindcss-language-server
		dockerfile-language-server-nodejs
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
