{ pkgs, ... }:
let
  bibata-modern-ice = pkgs.runCommand "bibata-modern-ice" { } ''
    mkdir -p $out/share/icons
    ln -s ${pkgs.fetchzip {
      url = "https://github.com/ful1e5/Bibata_Cursor/releases/download/v2.0.7/Bibata-Modern-Ice.tar.xz";
      hash = "sha256-SG/NQd3K9DHNr9o4m49LJH+UC/a1eROUjrAQDSn3TAU=";
    }} $out/share/icons/Bibata-Modern-Ice
  '';
in
{
  home.pointerCursor = {
    package = bibata-modern-ice;
    name = "Bibata-Modern-Ice";
    size = 48;
    gtk.enable = true;
    x11.enable = true;
  };
}
