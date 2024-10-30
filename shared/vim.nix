{ pkgs, lib, ... }:
{
	programs.vim = {
		enable = true;
		plugins = with pkgs.vimPlugins; [ 
			vim-nix 
			vim-lastplace 
			vim-sensible
			vim-commentary
			vim-surround
			vim-fugitive
            auto-pairs
			fzf-vim
			catppuccin-vim
		];
		settings = { ignorecase = true; };
		extraConfig = ''
			nnoremap <Space>f :Files<Cr>
			nnoremap <Space>w :w<Cr>
			nnoremap <Space>q :q<Cr>
			nnoremap <Space>o :RG<Cr>
			nnoremap <Tab> :bnext<Cr>
			nnoremap <S-Tab> :bprev<Cr>

			set cmdheight=1
			set relativenumber
			set wrap
			set shiftwidth=4
			set tabstop=4
			set termguicolors

			colorscheme catppuccin_mocha
		'';
	  };
}
