vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.opt.tabstop = 4
vim.opt.shiftwidth = 4

vim.opt.cursorline = true

-- Change cursor in normal & visual mode from block to line
vim.opt.guicursor = "c-sm:block,n-v-i-ci-ve:ver25,r-cr-o:hor20"



-- Winodws keys
vim.api.nvim_set_keymap("n", "<a-h>", "<c-w>h", {noremap=true})
vim.api.nvim_set_keymap("n", "<a-j>", "<c-w>j", {noremap=true})
vim.api.nvim_set_keymap("n", "<a-k>", "<c-w>k", {noremap=true})
vim.api.nvim_set_keymap("n", "<a-l>", "<c-w>l", {noremap=true})



-- Delete word
vim.api.nvim_set_keymap("i", "<c-bs>", "<esc>cvb", {noremap=true})
