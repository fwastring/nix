{
  lib,
  config,
  pkgs,
  ...
}:
let
  cfg = config.services.kitchenowl;
in
{
  virtualisation.oci-containers = {
    backend = "podman";
	containers = {
		kitchenowl = {
			image = "tombursch/kitchenowl:latest";
			volumes = [
			  "${cfg.dataDir}:/data"
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
