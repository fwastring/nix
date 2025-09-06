#!/bin/sh

sudo cp /etc/nixos/hardware-configuration.nix ./$1/nixos

sudo nixos-rebuild switch --flake "/home/fw/nix#$1"
