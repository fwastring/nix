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
	sops.defaultSopsFile = ../../secrets/fred.yaml;
  # This will automatically import SSH keys as age keys
  sops.age.sshKeyPaths = [ "~/.ssh/id_ed" ];
  # This is using an age key that is expected to already be in the filesystem
  sops.age.keyFile = "~/.config/sops/age/keys.txt";
  sops.secrets.spotify_password = {};

	services.xserver.dpi = 140;
	services.spotifyd.settings.password = "${config.sops.secrets.spotify_password}";
	# https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
	system.stateVersion = "23.11";
}
