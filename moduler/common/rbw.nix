{ pkgs, ... }:
{
  programs.rbw = {
  	enable = true;
	settings = {
		email = "fredrik@wastring.com";
		pinentry = pkgs.pinentry;
		url = "https://pass.wastring.com";
	};
  };
}
