{ pkgs, lib, ... }:
let
  dmenu = pkgs.dmenu.overrideAttrs (old: {
    src = builtins.fetchGit {
      url = "https://github.com/FredzyW/dmenu.git";
      rev = "7ec109778998462a6762745c65c47a73283b810e";
    };
    nativeBuildInputs = with pkgs; [
      xorg.libX11.dev
      xorg.libXft
      imlib2
      xorg.libXinerama
    ];
  });
in
{
  home.packages = [ dmenu ];
}
