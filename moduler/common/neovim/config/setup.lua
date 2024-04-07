-- Define a function to generate keybinds for navigating to files
local function setup_file_navigation_keybinds(start, stop)
    for i = start, stop do
        local keybind = string.format('<Space>h%d', i)
        local command = string.format(':lua require("harpoon.ui").nav_file(%d)<CR>', i)
        vim.keymap.set('n', keybind, command)
    end
end

setup_file_navigation_keybinds(1, 9)

require'fzf_lsp'.setup()

require("autoclose").setup({
	keys = {
		["$"] = { escape = true, close = true, pair = "$$", disabled_filetypes = { "haskell" } },
		["'"] = { escape = true, close = true, pair = "''", disabled_filetypes = { "markdown" } },
		["`"] = { escape = true, close = true, pair = "``", disabled_filetypes = { "markdown" } },
	},
})


require('bqf').setup()
require("ibl").setup()
require("focus").setup()
require("bufferline").setup()

local wk = require("which-key")
wk.register(mappings, opts)

local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
parser_config.csharp = {
  install_info = {
    url = "https://github.com/tree-sitter/tree-sitter-c-sharp", -- local path or git repo
    files = {"src/parser.c"}, -- note that some parsers also require src/scanner.c or src/scanner.cc
    branch = "master", -- default branch in case of git repo if different from master
    generate_requires_npm = false, -- if stand-alone parser without npm dependencies
    requires_generate_from_grammar = false, -- if folder contains pre-generated src/parser.c
  },
  filetype = "cs", -- if filetype does not match the parser name
}

require'nvim-treesitter.configs'.setup {
  ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "haskell", "python", "bash", "clojure",  "nix", "dockerfile", "latex", "csharp", "markdown" },
  sync_install = false,
  auto_install = true,
  ignore_install = { "javascript" },

  highlight = {
    enable = true,

    disable = function(lang, buf)
        local max_filesize = 100 * 1024 -- 100 KB
        local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
        if ok and stats and stats.size > max_filesize then
            return true
        end
    end,
    additional_vim_regex_highlighting = false,
  },
}



local function lsp()
	local clients = vim.lsp.buf_get_clients()
	if next(clients) == nil then
		return
	end

	for _, client in pairs(clients) do
		return ("[" .. client.name .. "]")
	end
end

require('lualine').setup {
	options = {
		icons_enabled = true,
		theme = 'base16',
		component_separators = { left = '|', right = '|' },
		section_separators = { left = '', right = '' },
		disabled_filetypes = {
			statusline = { 'neo-tree' },
			winbar = {},
		},
		ignore_focus = {},
		always_divide_middle = true,
		globalstatus = false,
		refresh = {
			statusline = 1000,
			tabline = 1000,
			winbar = 1000,
		}
	},
	sections = {
		lualine_a = { 'mode' },
		lualine_b = { 'branch', 'diff', 'diagnostics' },
		lualine_c = { 'filename' },
		lualine_x = { lsp },
		lualine_y = { 'filetype' },
		lualine_z = {}
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = { 'filename' },
		lualine_x = { 'location' },
		lualine_y = {},
		lualine_z = {}
	},
	tabline = {},
	winbar = {},
	inactive_winbar = {},
	extensions = {}
}

require("telescope").load_extension('harpoon')

-- LSP Setup
local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
	lsp_zero.default_keymaps({ buffer = bufnr })
end)
require 'lspconfig'.hls.setup {}
require 'lspconfig'.omnisharp.setup {
	cmd = { "/home/fw/.nix-profile/bin/dotnet", "/nix/store/jdp56g0j6mf7yjvqy9npw28y4pxcvgsw-omnisharp-roslyn-1.39.10/lib/omnisharp-roslyn/OmniSharp.dll" },
}
require 'lspconfig'.clojure_lsp.setup {}
require 'lspconfig'.nil_ls.setup {}
require 'lspconfig'.marksman.setup {}
require 'lspconfig'.pylsp.setup {}
require 'lspconfig'.bashls.setup {}
require 'lspconfig'.dockerls.setup {}
require 'lspconfig'.docker_compose_language_service.setup {}
require 'lspconfig'.ansiblels.setup {}
require 'lspconfig'.yamlls.setup {}
require 'lspconfig'.lua_ls.setup {
	settings = {
        Lua = {
            diagnostics = {
                globals = { 'vim' }
            }
        }
    }
}


require("catppuccin").setup({
	flavour = "macchiato",
	background = {
		light = "latte",
		dark = "mocha",
	},
	transparent_background = false,
	show_end_of_buffer = false,
	term_colors = false,
	dim_inactive = {
		enabled = false,
		shade = "dark",
		percentage = 0.15,
	},
	no_italic = false,
	no_bold = false,
	no_underline = false,
	styles = {
		comments = { "italic" },
		conditionals = { "italic" },
		loops = {},
		functions = {},
		keywords = {},
		strings = {},
		variables = {},
		numbers = {},
		booleans = {},
		properties = {},
		types = {},
		operators = {},
	},
	color_overrides = {},
	custom_highlights = {},
	integrations = {
		cmp = true,
		gitsigns = true,
		nvimtree = true,
		treesitter = true,
		notify = false,
		mini = {
			enabled = true,
			indentscope_color = "",
		},
	},
})

vim.cmd('colorscheme base16-catppuccin-macchiato')

local cmp = require('cmp')

cmp.setup({
	sources = {
		{ name = 'nvim_lsp' },
	},
	mapping = {
		['<CR>'] = cmp.mapping.confirm({ select = false }),
		['<C-e>'] = cmp.mapping.abort(),
		['<Up>'] = cmp.mapping.select_prev_item({ behavior = 'select' }),
		['<Down>'] = cmp.mapping.select_next_item({ behavior = 'select' }),
		['<Tab>'] = cmp.mapping.select_next_item({ behavior = 'select' }),
		['<C-p>'] = cmp.mapping(function()
			if cmp.visible() then
				cmp.select_prev_item({ behavior = 'insert' })
			else
				cmp.complete()
			end
		end),
		['<C-n>'] = cmp.mapping(function()
			if cmp.visible() then
				cmp.select_next_item({ behavior = 'insert' })
			else
				cmp.complete()
			end
		end),
	},
	snippet = {
		expand = function(args)
			require('luasnip').lsp_expand(args.body)
		end,
	},
})

