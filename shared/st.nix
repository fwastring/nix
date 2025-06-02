{ pkgs, ...}:
{
	environment.systemPackages = with pkgs; [
		(st.overrideAttrs (oldAttrs: rec {
			src = builtins.fetchGit {
				url = "https://github.com/fwastring/st";
				rev = "384ca157dbedaccf5939d75a6a2ea8137df5862d";
			};
			buildInputs = oldAttrs.buildInputs ++ [ xorg.libX11.dev xorg.libXft imlib2 xorg.libXinerama pkg-config];
		  }))
	];
}
