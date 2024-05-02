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
	# You can import other NixOS modules here
	imports = [
	./hardware-configuration.nix
	../../config/base.nix
	../../config/users.nix
	];

	networking.hostName = myhostname;

	services.xserver.dpi = 140;
	# services.spotifyd.settings.password = config.sops.secrets."spotify_password".path;
	# https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
	system.stateVersion = "23.11";
}
