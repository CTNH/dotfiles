vim.g.mapleader = ' '
vim.g.maplocalleader = ' '


-- Winodws keys
vim.api.nvim_set_keymap("n", "<a-h>", "<c-w>h", {noremap=true})
vim.api.nvim_set_keymap("n", "<a-j>", "<c-w>j", {noremap=true})
vim.api.nvim_set_keymap("n", "<a-k>", "<c-w>k", {noremap=true})
vim.api.nvim_set_keymap("n", "<a-l>", "<c-w>l", {noremap=true})


-- Delete word
vim.api.nvim_set_keymap("i", "<c-bs>", "<esc>cvb", {noremap=true})


-- Emacs keybinds in insert mode
vim.api.nvim_set_keymap("i", "<c-a>", "<Home>",    {noremap=true})
vim.api.nvim_set_keymap("i", "<c-b>", "<Left>",    {noremap=true})
vim.api.nvim_set_keymap("i", "<c-e>", "<End>",     {noremap=true})
vim.api.nvim_set_keymap("i", "<c-f>", "<Right>",   {noremap=true})
vim.api.nvim_set_keymap("i", "<a-g>", "<c-Left>",  {noremap=true})
vim.api.nvim_set_keymap("i", "<a-f>", "<c-Right>", {noremap=true})
vim.api.nvim_set_keymap("i", "<a-d>", "<ESC>lvec", {noremap=true})


-- ==== Buffers ====
vim.api.nvim_set_keymap('n', '<C-t>', ':tabnew<CR>', { noremap = true })
vim.keymap.set('n', '<leader>bn', ':bnext<CR>', {})
vim.keymap.set('n', '<leader>bx', ':bd<CR>', {})
vim.keymap.set('n', '<leader>n', ':bnext<CR>', {})
vim.keymap.set('n', '<leader>p', ':bprev<CR>', {})


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

