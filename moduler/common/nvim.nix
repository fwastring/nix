{
  config,
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
  ];
  programs = {
    neovim = {
      plugins = [
        ## Treesitter
        pkgs.vimPlugins.nvim-treesitter
        pkgs.vimPlugins.nvim-lspconfig

        pkgs.vimPlugins.plenary-nvim
        pkgs.vimPlugins.telescope-nvim
        pkgs.vimPlugins.telescope-fzf-native-nvim

        ## cmp
        pkgs.vimPlugins.nvim-cmp
        pkgs.vimPlugins.cmp-nvim-lsp

        pkgs.vimPlugins.luasnip
        pkgs.vimPlugins.cmp_luasnip
        pkgs.vimPlugins.vim-surround
        pkgs.vimPlugins.vim-obsession
        pkgs.vimPlugins.neoformat
        pkgs.vimPlugins.lazygit-nvim
        pkgs.vimPlugins.gitsigns-nvim
        pkgs.vimPlugins.lualine-nvim
        pkgs.vimPlugins.nvim-web-devicons
        pkgs.vimPlugins.leap-nvim
        pkgs.vimPlugins.vim-repeat

        ## Debugging
        pkgs.vimPlugins.nvim-dap
        pkgs.vimPlugins.nvim-dap-ui
        pkgs.vimPlugins.nvim-dap-virtual-text
      ];

      extraConfig = ''
        lua << EOF
        ${builtins.readFile config/mappings.lua}
        ${builtins.readFile config/options.lua}
        ${builtins.readFile config/setup.lua}
      '';
      enable = true;
      viAlias = true;
      vimAlias = true;
    };
  };
}
