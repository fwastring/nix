{ pkgs, lib, myhostname, ... }:
{
	programs.mpv = {
	  enable = true;

	  scripts = with pkgs.mpvScripts; [
		autoload
		uosc
	  ];

	  config = {
		profile = "high-quality";
		ytdl-format = "bestvideo+bestaudio";
		volume = "70";
	  };
	};
}
