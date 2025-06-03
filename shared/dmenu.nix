{ pkgs, lib, ... }:
let
  dmenu = pkgs.dmenu.overrideAttrs (old: {
    # nativeBuildInputs = with pkgs; [
    #   xorg.libX11.dev
    #   xorg.libXft
    #   imlib2
    #   xorg.libXinerama
    # ];
	patches = [ ../config/dmenu-center.diff ];
  });
in
{
  home.packages = [ dmenu ];
}
