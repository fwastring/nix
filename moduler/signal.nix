{
  lib,
  config,
  pkgs,
  ...
}:
let
in
{
  networking.firewall.allowedTCPPorts = [ 8081 ];

  # See this for docs on endpoints and more https://github.com/bbernhard/signal-cli-rest-api
  virtualisation.oci-containers = {
    backend = "podman";
	containers = {
		signal-cli = {
			image = "bbernhard/signal-cli-rest-api";
			volumes = [
			  "/var/signal:/home/.local/share/signal-cli"
			];
			ports = [ "192.168.1.227:8081:8080" ];
			environment = {
			  MODE = "native";
			  PORT = "8080";
			}
			;
		};
	};
  };
}
