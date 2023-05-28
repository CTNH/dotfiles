-- List of all plugins
local plugins = {
	-- Basic functional plugins
	'nvim-tree/nvim-tree.lua',
	'nvim-tree/nvim-web-devicons',
	'jiangmiao/auto-pairs',				-- Auto close parentheses
	{									-- Fuzzy Finder
		'nvim-telescope/telescope.nvim',
		tag = '0.1.1',
		dependencies = { 'nvim-lua/plenary.nvim' }
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
	'nvim-treesitter/nvim-treesitter',	-- Language parser for syntax highlight
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


-- ==== Keybinds ====
vim.api.nvim_set_keymap('n', '<C-t>', ':tabnew<CR>', { noremap = true })

-- ==== Startup ====
vim.cmd("colorscheme palenight")
vim.cmd("set number")		-- Line numbers
vim.cmd("set hidden")		-- Allows switching buffer without saving

