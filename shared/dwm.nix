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
      rev = "e9d94d70c3865a1289c20382df21acc3a138ed88";
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
