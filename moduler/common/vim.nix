{ pkgs, lib, ... }:
{
	environment.variables = { EDITOR = "vim"; };

	environment.systemPackages = with pkgs; [
	((vim_configurable.override {  }).customize{
	  name = "vim";
	  # Install plugins for example for syntax highlighting of nix files
	  vimrcConfig.packages.myplugins = with pkgs.vimPlugins; {
		start = [ 
			vim-nix 
			vim-lastplace 
			vim-dracula
			vim-sensible
			vim-commentary
			vim-fugitive
			fzf-vim
			YouCompleteMe
		];
		opt = [];
	  };
	  vimrcConfig.customRC = ''
		nnoremap <Space>e :Files<Cr>
		nnoremap <Space>w :w<Cr>
		nnoremap <Space>q :q<Cr>
		nnoremap <Tab> :bnext<Cr>
		nnoremap <S-Tab> :bprev<Cr>
		inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
		inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
		inoremap <expr> <cr>    pumvisible() ? asyncomplete#close_popup() : "\<cr>"

		set cmdheight=1
		set relativenumber
		set wrap
		set shiftwidth=4
		set tabstop=4
		set termguicolors
	  '';
	}
	)];
}
