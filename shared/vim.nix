{ pkgs, lib, ... }:
{
	programs.vim = {
		enable = true;
		plugins = with pkgs.vimPlugins; [ 
            ale
			vim-nix 
			vim-lastplace 
			dracula-vim
			vim-sensible
			vim-commentary
			vim-fugitive
			fzf-vim
			YouCompleteMe
            asyncomplete-vim
            asyncomplete-lsp-vim
            ultisnips
            vim-snippets
            vim-lsp
            vim-lsp-snippets
            vim-lsp-ultisnips
            vim-lsp-settings
            asyncomplete-lsp-vim
		];
		settings = { ignorecase = true; };
		extraConfig = ''
			nnoremap <Space>f :Files<Cr>
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
            colorscheme dracula

            function! s:on_lsp_buffer_enabled() abort
                setlocal omnifunc=lsp#complete
                setlocal signcolumn=yes
                if exists('+tagfunc') | setlocal tagfunc=lsp#tagfunc | endif
                nmap <buffer> gd <plug>(lsp-definition)
                nmap <buffer> gs <plug>(lsp-document-symbol-search)
                nmap <buffer> gS <plug>(lsp-workspace-symbol-search)
                nmap <buffer> gr <plug>(lsp-references)
                nmap <buffer> gi <plug>(lsp-implementation)
                nmap <buffer> gt <plug>(lsp-type-definition)
                nmap <buffer> <leader>rn <plug>(lsp-rename)
                nmap <buffer> [g <plug>(lsp-previous-diagnostic)
                nmap <buffer> ]g <plug>(lsp-next-diagnostic)
                nmap <buffer> K <plug>(lsp-hover)
                nnoremap <buffer> <expr><c-f> lsp#scroll(+4)
                nnoremap <buffer> <expr><c-d> lsp#scroll(-4)

                let g:lsp_format_sync_timeout = 1000
                autocmd! BufWritePre *.rs,*.go call execute('LspDocumentFormatSync')

                " refer to doc to add more commands
            endfunction

            augroup lsp_install
                au!
                " call s:on_lsp_buffer_enabled only for languages that has the server registered.
                autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
            augroup END
            if executable('nil')
              autocmd User lsp_setup call lsp#register_server({
                \ 'name': 'nil',
                \ 'cmd': {server_info->['nil']},
                \ 'whitelist': ['nix'],
                \ })
            endif

		'';
	  };
}
