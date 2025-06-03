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
      rev = "f70f48bdb01df6bae9c63131a6c84e812141788c";
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
      })
in
{
  home.packages = [
    dwm
    dwmblocks
  ];
}
