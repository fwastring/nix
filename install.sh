#!/bin/sh

#sudo cp /etc/nixos/hardware-configuration.nix ./$1/nixos

#sudo nixos-rebuild switch --flake ".#$2"

sudo nix-channel --add https://github.com/nix-community/home-manager/archive/release-25.05.tar.gz home-manager
sudo nix-channel --update

nix-shell '<home-manager>' -A install

#cp .xinitrc ~

#mkdir ~/wallpapers

#cp ./wallpapers/nix-black-4k.png ~/wallpapers/

#home-manager switch --flake ".#$3@$2"
