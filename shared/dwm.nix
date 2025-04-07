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
      rev = "7e10a592cbfd1cea2b6c5e77c3738716a390eb65";
    };
    nativeBuildInputs = with pkgs; [
      xorg.libX11.dev
      xorg.libXft
      imlib2
      xorg.libXinerama
    ];
  });
  dwmblocks =
    if myhostname == "desktop" then
      pkgs.dwmblocks.overrideAttrs (old: {
        src = builtins.fetchGit {
          url = "https://github.com/FredzyW/dwmblocks.git";
          rev = "7c81c55390f2deec2a3804217abe80221ef6f46a";
        };
      })
    else
      pkgs.dwmblocks.overrideAttrs (old: {
        src = builtins.fetchGit {
          url = "https://github.com/FredzyW/dwmblocks.git";
          rev = "ec1b1a61a80e0ba92842e5117736ff977bb6cfa5";
        };
      });
in
{
  home.packages = [
    dwm
    dwmblocks
  ];
}
