{
  inputs,
  lib,
  config,
  pkgs,
  myhostname,
  ...
}:
let
in
{
  networking.firewall = {
    enable = true;
    allowedTCPPorts = [
      6443
      5173
      8080
      3000
      8384
      22000
    ];
  };
  services.k3s = {
    enable = true;
    role = "server";
    extraFlags = toString ([
      "--write-kubeconfig-mode \"0644\""
      "--cluster-init"
      "--disable servicelb"
      "--disable traefik"
      "--disable local-storage"
    ]);
    clusterInit = true;
  };

  systemd.tmpfiles.rules = [
    "L+ /usr/local/bin - - - - /run/current-system/sw/bin/"
  ];

  services.openiscsi = {
    enable = true;
    name = "iqn.2016-04.com.open-iscsi:${myhostname}";
  };

  environment.systemPackages = with pkgs; [
    k3s
    cifs-utils
    nfs-utils
    git
  ];
}
