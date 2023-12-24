-- List of all plugins
local plugins = {
	-- Basic functional plugins
	'nvim-tree/nvim-tree.lua',
	'nvim-tree/nvim-web-devicons',
	'jiangmiao/auto-pairs',				-- Auto close parentheses
	{									-- Fuzzy Finder
		'nvim-telescope/telescope.nvim',
		dependencies = { 'nvim-lua/plenary.nvim' }
	},
	-- {
	-- 	"lukas-reineke/indent-blankline.nvim",
	-- 	main = "ibl",
	-- },
	{
		"shellRaining/hlchunk.nvim",
		event = { "UIEnter" },
		config = function()
			require("hlchunk").setup({
				indent = {
					enable = true,
					use_treesitter = false
				},
				-- hl_line_num = {
				-- 	enable = true,
				-- }
			})
		end
	},
	-- Appearance
	'joshdick/onedark.vim',				-- Theme
	'drewtempelmeyer/palenight.vim',	-- Theme
	'vim-airline/vim-airline',			-- Status bar
	{									-- Tab bar
		'crispgm/nvim-tabline',
		dependencies = { 'nvim-tree/nvim-web-devicons' },
	},
	-- {
	-- 	'romgrk/barbar.nvim',
	-- 	init = function() vim.g.barbar_auto_setup = false end,
	-- 	opts = {
	-- 		focus_on_close = 'previous',
	-- 	},
	-- },
	-- LSP & Autocomplete
	{
		'nvim-treesitter/nvim-treesitter',	-- Language parser for syntax highlight
		build = ":TSUpdate",
		config = function()
			require("nvim-treesitter.configs").setup({
				highlight = { enable = true },
				indent = { enable = true },
			})
		end,
	},
	'neovim/nvim-lspconfig',
	"williamboman/mason.nvim",			-- LSP Manager
	"williamboman/mason-lspconfig.nvim",
	'hrsh7th/cmp-nvim-lsp',				-- nvim-cmp source for builtin LSP client
	'hrsh7th/nvim-cmp',					-- Completion Engine
	'saadparwaiz1/cmp_luasnip',			-- luasnip completion source for nvim-cmp
	"rafamadriz/friendly-snippets",		-- Preconfigured different lanaguage snippets
	{									-- Snippet engine
		"L3MON4D3/LuaSnip",
		dependencies = { "rafamadriz/friendly-snippets" },
	},
	{"ellisonleao/glow.nvim", config = true, cmd = "Glow"},
}

require("core.keymaps")
require("core.plugin-manager")		-- Lazy plugin manager bootstrap
require("lazy").setup(plugins)

-- ==== Plugin Settings ====
require("core.plugins.nvim-tree")		-- Nvim Tree
require("core.plugins.lsp")				-- LSP
require("core.plugins.completions")		-- Autocomplete
require('tabline').setup({				-- Tabline
    show_index = true,			-- show tab index
    show_modify = true,			-- show buffer modification indicator
    show_icon = true,			-- show file extension icon
    fnamemodify = ':t',			-- file name modifier
    modify_indicator = '*',		-- modify indicator
    no_name = 'No name',		-- no name buffer name
    brackets = { '[', ']' },	-- file name brackets surrounding
    inactive_tab_max_length = 0	-- max length of inactive tab titles, 0 to ignore
})
require('glow').setup({
	install_path = "~/bin"
})

-- require("ibl").setup()


-- Telescope keybinds
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})


-- ==== Keybinds ====
vim.api.nvim_set_keymap('n', '<C-t>', ':tabnew<CR>', { noremap = true })

-- ==== Startup ====
vim.cmd("colorscheme palenight")
vim.cmd("set number")		-- Line numbers
vim.cmd("set hidden")		-- Allows switching buffer without saving
vim.cmd("set nofoldenable")	-- Disable folds at file open
-- vim.cmd("highlight Normal ctermbg=none")	-- Make background transparent
vim.cmd("highlight LineNr ctermfg=242")		-- Allows line numbers to be more visible

