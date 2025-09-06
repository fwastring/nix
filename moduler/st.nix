{ pkgs, ...}:
{
	environment.systemPackages = with pkgs; [
		(st.overrideAttrs (oldAttrs: rec {
			src = builtins.fetchGit {
				url = "https://github.com/fwastring/st";
				  rev = "2c6e38d2e735116e902962d03e8d7c88db8094bd";
			};
			buildInputs = oldAttrs.buildInputs ++ [ xorg.libX11.dev xorg.libXft imlib2 xorg.libXinerama pkg-config];
		  }))
	];
}
