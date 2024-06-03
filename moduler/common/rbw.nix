{ pkgs, lib, ... }:
{
	programs.rbw = {
		enable = true;
		settings = {
			email = "fredrik@wastring.com";
			base_url = "https://pass.wastring.com";
		};
	};
}
