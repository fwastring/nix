{ pkgs, ... }:
{
  programs.rbw = {
  	enable = true;
	settings = {
		email = "fredrik@wastring.com";
		pinentry = pkgs.pinentry;
		base_url = "https://pass.wastring.com";
	};
  };
}
