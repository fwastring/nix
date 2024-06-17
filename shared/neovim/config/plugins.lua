local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)


require("lazy").setup({
	{
		'm4xshen/autoclose.nvim',
	},
	{
		"BurntSushi/ripgrep",
	},
	{
		'kevinhwang91/rnvimr',
	},
	{
		'ThePrimeagen/harpoon',
	},
	{
		'ggandor/leap.nvim',
	},
	{
		'gfanto/fzf-lsp.nvim',
	},
	{
		'junegunn/fzf.vim',
	},
	{
		"junegunn/fzf",
		name = "fzf",
		dir = "~/.fzf",
		build = "./install --all"
	},
	{
		'RRethy/base16-nvim',
	},
	{
		"folke/which-key.nvim",
	},
	{
		"folke/neodev.nvim",
	},
	{
		"mfussenegger/nvim-dap",
	},
	{
		'neovim/nvim-lspconfig'
	},
	{
		'hrsh7th/cmp-nvim-lsp'
	},
	{
		'hrsh7th/nvim-cmp'
	},
	{
		'nvim-focus/focus.nvim',
		version = false
	},
	{
		"folke/neoconf.nvim",
		cmd = "Neoconf"
	},
	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		opts = {}
	},
	{
	  'mrjones2014/legendary.nvim',
	  -- since legendary.nvim handles all your keymaps/commands,
	  -- its recommended to load legendary.nvim before other plugins
	  priority = 10000,
	  lazy = false,
	  -- sqlite is only needed if you want to use frecency sorting
	  -- dependencies = { 'kkharji/sqlite.lua' }
	},
	{
		'VonHeikemen/lsp-zero.nvim',
		branch = 'v3.x'
	},
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000
	},
	{
		'kevinhwang91/nvim-bqf'
	},
	{
		'akinsho/bufferline.nvim',
		version = "*",
		dependencies = 'nvim-tree/nvim-web-devicons'
	},
	{
		'nvim-telescope/telescope-fzf-native.nvim',
		build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build'
	},
	{
		"L3MON4D3/LuaSnip",
		version = "v2.*",
		build = "make install_jsregexp"
	},
	{
		"gbprod/substitute.nvim",
		opts = {}
	},
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate"
	},
	{
		"michaelb/sniprun",
		branch = "master",
		build = "sh install.sh",
		config = function()
			require("sniprun").setup({})
		end,
	},
	{
		'nvim-telescope/telescope.nvim',
		tag = '0.1.6',
		dependencies = {
			'nvim-lua/plenary.nvim'
		}
	},
	{
		'mrcjkb/haskell-tools.nvim',
		version = '^3',
		ft = { 'haskell', 'lhaskell', 'cabal', 'cabalproject' },
	},
	{
		"kdheepak/lazygit.nvim",
		cmd = {
			"LazyGit",
			"LazyGitConfig",
			"LazyGitCurrentFile",
			"LazyGitFilter",
			"LazyGitFilterCurrentFile",
		},
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		keys = {
			{ "<leader>gg", "<cmd>LazyGit<cr>", desc = "LazyGit" }
		}
	},
	{
		'nvim-lualine/lualine.nvim',
		dependencies = { 'nvim-tree/nvim-web-devicons' }
	},
	{
		'numToStr/Comment.nvim',
		opts = {},
		lazy = false,
	},

})

