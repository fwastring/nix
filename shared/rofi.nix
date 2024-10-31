{ pkgs, lib, ... }:
{
	programs.rofi = {
		enable = true;
		plugins = with pkgs; [
			rofi-calc
			rofi-pulse-select
		];
		font = "FiraCode NerdFont 17";
	};
}
