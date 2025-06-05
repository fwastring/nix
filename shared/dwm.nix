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
      rev = "eaf3279653491212fe9945d41938bfcaba990d64";
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
