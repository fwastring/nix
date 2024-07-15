{ pkgs, lib, ... }:
{
  programs.git = {
    enable = true;
    userName = "FredzyW";
    userEmail = "fredrik@wastring.com";
	extraConfig = {
		url."git@github.com:".insteadOf = "https://github.com/";
	};
  };
}
