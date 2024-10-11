{ pkgs, lib, ... }:
{
	programs.rofi = {
		enable = true;
		plugins = with pkgs; [
			rofi-calc
			rofi-bluetooth
			rofi-screenshot
			rofi-power-menu
			rofi-pulse-select
			pinentry-rofi
		];
	};
}
