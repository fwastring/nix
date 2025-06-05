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
		timewarrior

		sqlc
		postgresql
		argocd
		gh
		ngrok
		tailwindcss
		yarn
		plantuml
		go
		templ
		goa
		prettierd
		qrencode
		air
		unstable.k9s
		git
		lazydocker
		kubectl
		gcc
		gnumake
		cmake
		jq
		git
		(wrapHelm kubernetes-helm {
		  plugins = with pkgs.kubernetes-helmPlugins; [
			helm-secrets
			helm-diff
			helm-s3
			helm-git
		  ];
		})
		k3sup
	];
}
