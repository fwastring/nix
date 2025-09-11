{
  lib,
  config,
  pkgs,
  ...
}:
let
in
{
  virtualisation.oci-containers = {
    backend = "podman";
	containers = {
		signal-cli = {
			image = "bbernhard/signal-cli-rest-api";
			volumes = [
			  "/var/signal:/home/.local/share/signal-cli"
			];
			ports = [ "127.0.0.1:8000:8080" ];
			environment = {
			  MODE = "native";
			}
			;
		};
	};
  };
}
