{
  pkgs,
  lib,
  myhostname,
  ...
}:
let
  dwm = pkgs.dwm.overrideAttrs (old: {
    src = builtins.fetchGit {
      url = "https://github.com/FredzyW/dwm-conf.git";
      rev = "b50e98d6921e7ade6658576ece17a04e19f4f564";
    };
    nativeBuildInputs = with pkgs; [
      xorg.libX11.dev
      xorg.libXft
      imlib2
      xorg.libXinerama
    ];
  });
  dwmblocks =
      pkgs.dwmblocks.overrideAttrs (old: {
        src = builtins.fetchGit {
          url = "https://github.com/FredzyW/dwmblocks.git";
      rev = "d60ccc8c1180aa617fb1033bf1e44a2866647764";
        };
  });
in
{
  home.packages = [
    dwm
    dwmblocks
  ];
}
