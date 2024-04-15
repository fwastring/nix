
{ pkgs, lib, ... }:
{
	programs.aerc = {
		enable = true;
		extraConfig = {
			filters = {
				"text/plain"="colorize";
				"text/calendar"="calendar";
				"message/delivery-status"="colorize";
				"message/rfc822"="colorize";
				"text/html"="pandoc -f html -t plain | colorize";
				"image/*"="feh -";
				"application/pdf"="zathura -";
			};
		};
	};
}
