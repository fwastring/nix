{ pkgs, lib, ... }:
{
	programs.oh-my-posh = {
		enable = true;
		enableFishIntegration = true;
		settings = {
		  "$schema"= "https://raw.githubusercontent.com/JanDeDobbeleer/oh-my-posh/main/themes/schema.json";
		  "palette" =  {
				"os"= "#ACB0BE";
				"closer"= "p:os";
				"pink"= "#F5BDE6";
				"lavender"= "#B7BDF8";
				"blue"=  "#8aadf4";
				"peach" = "#f5a97f";
				"red" = "#ed8796";
				"green" = "#a6da95";
				"mauve" = "#c6a0f6";
		  };
		  "blocks"= [
			{
			  "alignment"= "left";
			  "newline" = true;
			  "type"= "prompt";
			  "segments" = [
				  {
				  "background"= "transparent";
				  "foreground"= "p:blue";
				  # "powerline_symbol"= "\ue0b4";
				  # "leading_diamond"= "\ue0b6";
				  "style"= "diamond";
				  "template"= "{{.Icon}}  ";
				  "type"= "os";
				}
				{
				  "foreground"= "p:peach";
				  "properties"= {
					# "folder_icon"= "..\\ue5fe..";
					"home_icon"= "~";
					"style"= "unique";
				  };
				  "style"= "plain";
				  "template"= "{{ .Path }} ";
				  "type"= "path";
				}
				{
				  "foreground"= "p:green";
				  "properties"= {
					# "branch_icon"= "\\ue725 ";
					# "cherry_pick_icon"= "\\ue29b ";
					# "commit_icon"= "\\uf417 ";
					"fetch_status"= false;
					"fetch_upstream_icon"= false;
					# "merge_icon"= "\\ue727 ";
					# "no_commits_icon"= "\\uf0c3 ";
					# "rebase_icon"= "\\ue728 ";
					# "revert_icon"= "\\uf0e2 ";
					# "tag_icon"= "\\uf412 ";
				  };
				  "template"= "{{ .HEAD }} ";
				  "style"= "plain";
				  "type"= "git";
				}
				{
				  "style"= "plain";
				  "foreground"= "p:closer";
				  "type"= "text";
				}
				{
				  "foreground"= "p:mauve";
				  "style"= "plain";
				  "template"= "{{ .UserName }}@{{ .HostName }} ";
				  "type"= "session";
				}
			  ];
			}
			{
			  "type"= "prompt";
			  "alignment"= "left";
			  "newline" = true;
			  "segments" = [
				{
					"type" = "text";
					"style" = "plain";
					"background"= "transparent";
					"foreground_templates"= [
						"{{if gt .Code 0}}p:red{{end}}"
						"{{if eq .Code 0}}p:green{{end}}"
					];
					"template"= "";
				}
			  ];
			}
		  ];
		  "final_space"= true;
		  "version"= 2;
		  "transient_prompt"= {
				"background"= "transparent";
				"foreground_templates"= [
					"{{if gt .Code 0}}p:red{{end}}"
					"{{if eq .Code 0}}p:green{{end}}"
				];
				"template"= " ";
			};
		  "secondary_prompt"= {
				"background"= "transparent";
				"foreground_templates"= [
					"{{if gt .Code 0}}p:red{{end}}"
					"{{if eq .Code 0}}p:green{{end}}"
				];
				"template"= " ";
			};
		};
	};
}
