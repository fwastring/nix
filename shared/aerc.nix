
{ pkgs, lib, ... }:
{
	programs.aerc = {
		enable = true;
		extraConfig = {
			general = {
				"pgp-provider" = "gpg";
				"log-file" = "~/.config/aerc/messages.log";
			};
			filters = {
				"text/plain"="bat";
				"text/calendar"="calendar";
				"message/delivery-status"="colorize";
				"message/rfc822"="colorize";
				"text/html"="pandoc -f html -t plain | colorize";
				"image/*"="feh -";
				"application/pdf"="zathura -";
			};
			ui = {
				"border-char-vertical"="│";
				"border-char-horizontal"="─";
				"styleset-name"="catppuccin-latte";
				"icon-unencrypted" = "🔓";
				"icon-encrypted" = "🔒";
				"icon-signed" = "✔";
				"icon-signed-encrypted" = "✅";
			};
			templates = {
				"new-message" = "signature.txt";
			};
		};
		stylesets = {
			catppuccin-latte = ''
				*.default=true
				*.normal=true

				default.fg=#4c4f69

				error.fg=#d20f39
				warning.fg=#fe640b
				success.fg=#40a02b

				tab.fg=#9ca0b0
				tab.bg=#e6e9ef
				tab.selected.fg=#4c4f69
				tab.selected.bg=#eff1f5
				tab.selected.bold=true

				border.fg=#dce0e8
				border.bold=true

				msglist_unread.bold=true
				msglist_flagged.fg=#df8e1d
				msglist_flagged.bold=true
				msglist_result.fg=#1e66f5
				msglist_result.bold=true
				msglist_*.selected.bold=true
				msglist_*.selected.bg=#ccd0da

				dirlist_*.selected.bold=true
				dirlist_*.selected.bg=#ccd0da

				statusline_default.fg=#7c7f93
				statusline_default.bg=#ccd0da
				statusline_error.bold=true
				statusline_success.bold=true

				completion_default.selected.bg=#ccd0da


				[viewer]
				url.fg=#1e66f5
				url.underline=true
				header.bold=true
				signature.dim=true
				diff_meta.bold=true
				diff_chunk.fg=#1e66f5
				diff_chunk_func.fg=#1e66f5
				diff_chunk_func.bold=true
				diff_add.fg=#40a02b
				diff_del.fg=#d20f39
				quote_*.fg=#9ca0b0
				quote_1.fg=#7c7f93
			'';
		};
	};
}
