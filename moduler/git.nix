{ pkgs, lib, ... }:
{
  programs.git = {
    enable = true;
	config = {
		user = {
			name = "fwastring";
			email = "fredrik@wastring.com";
		};
		pull = {
			rebase = false;
		};
		url."git@github.com:".insteadOf = "https://github.com/";
	};
  };
}
