{ pkgs, lib, ... }:
let
  dmenu = pkgs.dmenu.overrideAttrs (old: {
    # nativeBuildInputs = with pkgs; [
    #   xorg.libX11.dev
    #   xorg.libXft
    #   imlib2
    #   xorg.libXinerama
    # ];
	patches = [ ../moduler/dmenu-center.diff ];
  });
in
{
  home.packages = [ dmenu ];
}
