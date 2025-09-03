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
	nix.settings.trusted-users = [ "root" "fw" ];

  	environment.systemPackages = with pkgs; [
		timewarrior

		devenv


		# Containers
		kubectl
		docker-slim
		dive
		buildkit
		containerd
		cri-tools
		yq
		skopeo
		umoci
		velero
		podman-tui

		azure-cli
		dotnetCorePackages.dotnet_9.sdk
		google-cloud-sdk
		jira-cli-go
		gh
		allure
		kubectx
		python314

		awscli
		unstable.minio-client
		hugo
		sqlc
		postgresql
		go-migrate-pg
		argocd
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
