{
  lib,
  config,
  pkgs,
  ...
}:
{
  options = {
    kubernetes-tools.enable = lib.mkEnableOption "enables kubernetes-tools";
  };

  config = lib.mkIf config.kubernetes-tools.enable {
    environment.systemPackages = with pkgs; [
      kubectl
      buildkit
      argocd
      containerd
      cri-tools
      kubectx
      (wrapHelm kubernetes-helm {
        plugins = with pkgs.kubernetes-helmPlugins; [
          helm-secrets
          helm-diff
          helm-s3
          helm-git
        ];
      })
      k3sup
    ];

  };
}
