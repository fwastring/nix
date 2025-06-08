{
  inputs,
  lib,
  config,
  pkgs,
  myhostname,
  ...
}:
let
	go-migrate-pg = pkgs.go-migrate.overrideAttrs(oldAttrs: {
	  tags = ["postgres"];
	});
in
{

  	environment.systemPackages = with pkgs; [
		timewarrior

		kubectl
		azure-cli
		dotnetCorePackages.sdk_8_0_3xx
		docker-slim

		sqlc
		postgresql
		go-migrate-pg
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
