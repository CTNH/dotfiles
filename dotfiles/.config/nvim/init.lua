-- Lazy requires leader key to be set first
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
-- Lazy plugin manager bootstrap
require("core.plugin-manager")
require("lazy").setup("plugins")
-- Keybinds
require("core.keymaps")

vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.cursorline = true
-- Change cursor in normal & visual mode from block to line
vim.opt.guicursor = "c-sm:block,n-v-i-ci-ve:ver25,r-cr-o:hor20"

vim.opt.shell = "/usr/bin/zsh"

-- ==== Startup ====
-- vim.cmd("autocmd BufWrite * mkview")
-- vim.cmd("autocmd BufRead * silent! loadview")
vim.cmd("autocmd BufWinLeave *.* mkview")				-- Save folds
vim.cmd("autocmd BufWinEnter *.* silent! loadview")		-- Load folds

vim.cmd("colorscheme palenight")
vim.cmd("set number")		-- Line numbers
vim.cmd("set rnu")			-- Relative Line numbers
vim.cmd("set hidden")		-- Allows switching buffer without saving
vim.cmd("set nofoldenable")	-- Disable folds at file open
-- vim.cmd("highlight Normal ctermbg=none")	-- Make background transparent
vim.cmd("highlight LineNr ctermfg=242")		-- Allows line numbers to be more visible
vim.cmd("set notermguicolors")

