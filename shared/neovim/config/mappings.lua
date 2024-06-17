vim.keymap.set('n', 'z', '<Plug>(leap)')
vim.keymap.set('n', 'Z', '<Plug>(leap-from-window)')
vim.keymap.set({ 'x', 'o' }, 'z', '<Plug>(leap-forward)')
vim.keymap.set({ 'x', 'o' }, 'Z', '<Plug>(leap-backward)')

-- Harpoon
vim.keymap.set('n', '<Space>ha', ':lua require("harpoon.mark").add_file()<CR>')
vim.keymap.set('n', '<Space>hf', ':Telescope harpoon marks<CR>')
vim.keymap.set('n', '<Space>he', ':lua require("harpoon.ui").toggle_quick_menu()<CR>')
vim.keymap.set('n', '<Space>hn', ':lua require("harpoon.ui").nav_next()<CR>')
vim.keymap.set('n', '<Space>hb', ':lua require("harpoon.ui").nav_prev()<CR>')

vim.cmd('highlight! HarpoonInactive guibg=NONE guifg=#63698c')
vim.cmd('highlight! HarpoonActive guibg=NONE guifg=white')
vim.cmd('highlight! HarpoonNumberActive guibg=NONE guifg=#7aa2f7')
vim.cmd('highlight! HarpoonNumberInactive guibg=NONE guifg=#7aa2f7')
vim.cmd('highlight! TabLineFill guibg=NONE guifg=white')

local opts = { noremap = true, silent = true }

-- Substitute
vim.keymap.set("n", "s", require('substitute').operator, { noremap = true })
vim.keymap.set("n", "ss", require('substitute').line, { noremap = true })
vim.keymap.set("n", "S", require('substitute').eol, { noremap = true })
vim.keymap.set("x", "s", require('substitute').visual, { noremap = true })

-- Move commands
vim.keymap.set('n', '<Super-j>', ':MoveLine(1)<CR>', opts)
vim.keymap.set('n', '<Super-k>', ':MoveLine(-1)<CR>', opts)
vim.keymap.set('v', '<Super-j>', ':MoveBlock(1)<CR>', opts)
vim.keymap.set('v', '<Super-k>', ':MoveBlock(-1)<CR>', opts)

-- Good navigation mappings for wrap
vim.api.nvim_set_keymap('n', 'j', 'gj', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'k', 'gk', { noremap = true, silent = true })

-- Buffer navigation
vim.api.nvim_set_keymap('n', '<Tab>', ':bnext<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<S-Tab>', ':bprevious<CR>', { noremap = true, silent = true })

-- Window navigation
vim.api.nvim_set_keymap('n', '<C-k>', ':wincmd k<CR>', { silent = true })
vim.api.nvim_set_keymap('n', '<C-j>', ':wincmd j<CR>', { silent = true })
vim.api.nvim_set_keymap('n', '<C-h>', ':wincmd h<CR>', { silent = true })
vim.api.nvim_set_keymap('n', '<C-l>', ':wincmd l<CR>', { silent = true })

vim.api.nvim_set_keymap('n', '<Space>c', ':bd<CR>', { silent = true })

-- Sniprun
vim.api.nvim_set_keymap('v', 'f', '<Plug>SnipRun', { silent = true })
vim.api.nvim_set_keymap('n', '<leader>f', '<Plug>SnipRunOperator', { silent = true })
vim.api.nvim_set_keymap('n', '<leader>ff', '<Plug>SnipRun', { silent = true })

-- Highlight yanked
vim.api.nvim_create_autocmd('TextYankPost', {
	group = vim.api.nvim_create_augroup('highlight_yank', {}),
	desc = 'Hightlight selection on yank',
	pattern = '*',
	callback = function()
		vim.highlight.on_yank { higroup = 'IncSearch', timeout = 200 }
	end,
})

-- Telescope bindings
vim.keymap.set('n', '<Space>ff', builtin.find_files, {})
vim.keymap.set('n', '<Space>fg', builtin.live_grep, {})
vim.keymap.set('n', '<Space>fb', builtin.buffers, {})
vim.keymap.set('n', '<Space>fh', builtin.help_tags, {})


-- Bindings for save and quit
vim.api.nvim_set_keymap('n', '<Space>w', ':w<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Space>q', ':q<CR>', {})

-- Neotree bindings
vim.api.nvim_set_keymap('n', '<Space>e', ':RnvimrToggle<CR>', { noremap = true, silent = true })
vim.api.nvim_set_var('rnvimr_enable_ex', 1)
vim.api.nvim_set_var('rnvimr_enable_picker', 1)
vim.api.nvim_set_var('rnvimr_edit_cmd', 'drop')
vim.api.nvim_set_var('rnvimr_draw_border', 0)
vim.api.nvim_set_var('rnvimr_hide_gitignore', 1)
vim.api.nvim_set_var('rnvimr_border_attr', {fg = 14, bg = -1})
vim.api.nvim_set_var('rnvimr_enable_bw', 1)
vim.api.nvim_set_var('rnvimr_shadow_winblend', 70)
vim.api.nvim_set_var('rnvimr_ranger_cmd', {'ranger', '--cmd=set draw_borders both'})

