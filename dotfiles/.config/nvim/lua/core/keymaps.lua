vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.keymap.set("n", "<leader>s", ":w<CR>", {noremap=true})
vim.keymap.set("n", "<leader>l", ":set rnu!<CR>", {noremap=true})

-- Windows keys
vim.api.nvim_set_keymap("n", "<a-h>", "<c-w>h", {noremap=true})
vim.api.nvim_set_keymap("n", "<a-j>", "<c-w>j", {noremap=true})
vim.api.nvim_set_keymap("n", "<a-k>", "<c-w>k", {noremap=true})
vim.api.nvim_set_keymap("n", "<a-l>", "<c-w>l", {noremap=true})


-- Delete word
vim.api.nvim_set_keymap("i", "<c-bs>", "<esc>cvb", {noremap=true})


-- Emacs keybinds in insert mode
vim.keymap.set("i", "<c-a>", "<Home>",    {noremap=true})
vim.keymap.set("i", "<c-b>", "<Left>",    {noremap=true})
vim.keymap.set("i", "<c-e>", "<End>",     {noremap=true})
vim.keymap.set("i", "<c-f>", "<Right>",   {noremap=true})
vim.keymap.set("i", "<c-d>", "<Delete>",  {noremap=true})
vim.keymap.set("i", "<a-v>", "<c-Left>",  {noremap=true})
vim.keymap.set("i", "<a-f>", "<c-Right>", {noremap=true})
vim.keymap.set("i", "<a-d>", "<ESC>lvec", {noremap=true})
vim.keymap.set("i", "<a-q>", "<ESC>",     {noremap=true})
vim.keymap.set("i", "<a-r>", "<bs>",     {noremap=true})

vim.keymap.set("v", "<a-q>", "<ESC>",     {noremap=true})



-- ==== Buffers ====
vim.keymap.set('n', '<C-t>', ':tabnew<CR>', { noremap = true })
vim.keymap.set('n', '<leader>bn', ':bnext<CR>', {})
vim.keymap.set('n', '<leader>bx', ':bd<CR>', 	{})
vim.keymap.set('n', '<leader>n',  ':bnext<CR>', {})
vim.keymap.set('n', '<leader>p',  ':bprev<CR>', {})


-- Terminal
vim.keymap.set('t', '<s-esc>', [[<C-\><C-n>]],		 {noremap = true})		-- Put terminal in normal mode
vim.keymap.set('t', '<a-v>', [[<C-\><C-n>]],		 {noremap = true})		-- Put terminal in normal mode
vim.keymap.set('t', '<a-e>',   "<cmd>:q<CR>",		 {noremap = true})		-- Close terminal

-- Toggleterm
vim.keymap.set('n', '<a-e>', "<cmd>ToggleTerm<CR>", { noremap = true })
vim.keymap.set('n', '<leader>tv', "<cmd>ToggleTerm direction=vertical<CR>", { noremap = true })		-- Open toggleterm vertically
vim.keymap.set('n', '<leader>tf', "<cmd>ToggleTerm direction=float<CR>", { noremap = true })		-- Open toggleterm horizontally
vim.keymap.set(		-- Lazygit
	"n",
	"<leader>tl",
	"<cmd>lua require('toggleterm.terminal').Terminal:new({ cmd = 'lazygit', hidden = true }):toggle()<CR>",
	{ noremap = true, silent = true }
)
vim.keymap.set(
	"v",
	"<space>s",
	function()
    	require("toggleterm").send_lines_to_terminal(
			"single_line",
			trim_spaces,
			{ args = vim.v.count }
		)
	end
)

-- LSP
vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})		-- 'K' to show
-- vim.keymap.set('n', 'K', vim.lsp.buf.definition, {})
-- Renames all references to symbol under cursor
-- vim.keymap.set('n', 'K', vim.lsp.buf.rename, {})

-- Telescope keybinds
local telescopeBuiltin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', telescopeBuiltin.find_files, {})
vim.keymap.set('n', '<leader>fg', telescopeBuiltin.live_grep, {})
vim.keymap.set('n', '<leader>fb', telescopeBuiltin.buffers, {})
vim.keymap.set('n', '<leader>fh', telescopeBuiltin.help_tags, {})

vim.keymap.set('n', '<leader>gf', telescopeBuiltin.git_files, {})
vim.keymap.set('n', '<leader>gc', telescopeBuiltin.git_commits, {})

vim.keymap.set('n', '<leader>bt', telescopeBuiltin.current_buffer_tags, {})
vim.keymap.set('n', '<leader>bb', telescopeBuiltin.buffers, {})

vim.keymap.set('n', '<leader>ts', telescopeBuiltin.treesitter, {})
vim.keymap.set('n', '<leader>jl', telescopeBuiltin.jumplist, {})
vim.keymap.set('n', '<leader>cs', telescopeBuiltin.colorscheme, {})

