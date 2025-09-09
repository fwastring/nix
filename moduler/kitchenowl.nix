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
		kitchenowl = {
			image = "tombursch/kitchenowl:latest";
			volumes = [
			  "/var/kitchenowl:/data"
			];
			ports = [ "127.0.0.1:8080:8080" ];
			environment = {
			  JWT_SECRET_KEY = "jkdlaksjdljlkjlq";
			}
			;
		};
	};
  };
}
