{ pkgs, lib, myhostname, ... }:
let
  dwm = pkgs.dwm.overrideAttrs (old: {
    src = builtins.fetchGit {
      url = "https://github.com/FredzyW/dwm-conf.git";
      rev = "964a3b9c94e780636a1a4ef01afb90ab8de4bb6d";
    };
    nativeBuildInputs = with pkgs; [ 
      xorg.libX11.dev
      xorg.libXft
      imlib2
      xorg.libXinerama
    ];
  });
  dwmblocks = if myhostname == "desktop" then pkgs.dwmblocks.overrideAttrs (old: {
    src = builtins.fetchGit {
      url = "https://github.com/FredzyW/dwmblocks.git";
      rev = "7c81c55390f2deec2a3804217abe80221ef6f46a";
    };
  }) else pkgs.dwmblocks.overrideAttrs (old: {
    src = builtins.fetchGit {
      url = "https://github.com/FredzyW/dwmblocks.git";
      rev = "a334789ec7b9171a3c8e1fcac2ffe8463ee438dc";
    };
  });
in
{
  home.packages = [ dwm dwmblocks ];
}

