{
  config,
  inputs,
  pkgs,
  ...
}:

let
in
{
  sops.secrets.github_password = { };
  virtualisation.oci-containers = {
    backend = "podman";
    containers = {
      wedding = {
        login = {
          username = "fwastring";
          passwordFile = config.sops.secrets.github_password.path;
          registry = "https://ghcr.io";
        };
        image = "ghcr.io/fwastring/wedding:8eed91e3c05fde5f826f25de4c7bccdbc312caef";
        ports = [ "127.0.0.1:8083:8080" ];
      };
    };
  };
  services.nginx = {
    virtualHosts."wedding.wastring.com" = {
      enableACME = true;
      forceSSL = true;
      locations."/" = {
        proxyPass = "http://127.0.0.1:8083";
        proxyWebsockets = true;
      };
    };
  };
}
