{
  inputs,
  lib,
  config,
  pkgs,
  myhostname,
  ...
}:
let
  go-migrate-pg = pkgs.go-migrate.overrideAttrs (oldAttrs: {
    tags = [ "postgres" ];
  });
in
{
  nix.settings.trusted-users = [
    "root"
    "fw"
  ];

  environment.systemPackages = with pkgs; [
  	# Neovim
	inputs.neovim-nightly-overlay.packages.${pkgs.system}.default

  	# Nix
    devenv
    nixfmt-rfc-style

	# Docker
    dive
    lazydocker

	# Jobb
    azure-cli
    dotnetCorePackages.dotnet_9.sdk
    jira-cli-go
    gh

	# Minio
    awscli
    minio-client

	# Blogging
    hugo
	zola

	# System Design
    sqlc
    postgresql
    plantuml

	# Web Dev
    tailwindcss
    prettierd

	# Go
    air
    go
    templ
    go-migrate-pg

	# Build
    git
    gcc
    gnumake
    cmake

	# System Tools
    yq
    jq
    git
    qrencode
  ];
}
