{ pkgs, lib, myhostname, ... }:
let
  dwm = pkgs.dwm.overrideAttrs (old: {
    src = builtins.fetchGit {
      url = "https://github.com/FredzyW/dwm-conf.git";
      # rev = "99a1e812295bcf65625a4b5a0dc1022658977920";
      # rev = "99f005ad0e5e5c904262e980b541cd6f0d001949";
      rev = "d8bf4fa606714c219468828aaf64e71d46ca6288";
      # rev = "577d43c76b193f45ed74f9f403946ea3cc4298cf";
      # url = "https://git.wastring.com/fw/dwm.git";
      # rev = "04039f157960b83f1ab8abebb0ea77c72a75a249";
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
      # url = "https://git.wastring.com/fw/dwmblocks.git";
      # rev = "ce19d482155f3292dc77179a2485670a48d2669c";
    };
  }) else pkgs.dwmblocks.overrideAttrs (old: {
    src = builtins.fetchGit {
      url = "https://github.com/FredzyW/dwmblocks.git";
      rev = "a334789ec7b9171a3c8e1fcac2ffe8463ee438dc";
      # url = "https://git.wastring.com/fw/dwmblocks.git";
      # rev = "52198f692f5965b3e86577e8481e035d4c37ab52";
    };
  });
in
{
  home.packages = [ dwm dwmblocks ];
}

