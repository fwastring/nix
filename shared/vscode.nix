{ pkgs, ... }:
{
	programs.vscode = {
	  enable = true;
	  extensions = with pkgs.vscode-extensions; [
		vscodevim.vim
		jebbs.plantuml
	  ];
	};

}
