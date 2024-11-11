{ pkgs, lib, myhostname, ... }:
let
  dwm = pkgs.dwm.overrideAttrs (old: {
    src = builtins.fetchGit {
      url = "https://github.com/FredzyW/dwm-conf.git";
      rev = "3b9d96ece2c814a1c50d59de68587b2a4eee4ff8";
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

