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
	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
	},
	-- {
	-- 	"shellRaining/hlchunk.nvim",
	-- 	event = { "UIEnter" },
	-- 	config = function()
	-- 		require("hlchunk").setup({
	-- 			indent = {
	-- 				enable = true,
	-- 				use_treesitter = false
	-- 			},
	-- 		})
	-- 	end
	-- },
	-- Appearance
	'joshdick/onedark.vim',				-- Theme
	'drewtempelmeyer/palenight.vim',	-- Theme
	-- 'vim-airline/vim-airline',			-- Status bar
	{									-- Status bar
		'nvim-lualine/lualine.nvim',
		dependencies = { 'nvim-tree/nvim-web-devicons' }
	},
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
	{'akinsho/toggleterm.nvim', version = "*", opts = {--[[ things you want to change go here]]}},
	{'lervag/vimtex'},					-- LaTeX
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

local lualineTheme = require'lualine.themes.onedark'
lualineTheme.normal.a.bg = '#4078f2'
lualineTheme.insert.a.bg = '#50a14f'
require('lualine').setup {
	options = {
		icons_enabled = true,
		theme = lualineTheme,
		component_separators = { left = '', right = ''},
		section_separators = { left = '', right = ''},
		disabled_filetypes = {
			statusline = {},
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
		lualine_a = {'mode'},
		lualine_b = {'branch', 'diff', 'diagnostics'},
		lualine_c = {'filename'},
		lualine_x = {'filetype', 'encoding', 'fileformat'},
		lualine_y = {'progress'},
		lualine_z = {'location'}
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = {'filename'},
		lualine_x = {'filetype', 'encoding', 'fileformat'},
		lualine_y = {'progress'},
		lualine_z = {'location'}
	},
	tabline = {
		lualine_a = {'buffers'},
		lualine_b = {},
		lualine_c = {},
		lualine_x = {},
		lualine_y = {},
		lualine_z = {'tabs'}
	},
	winbar = {},
	inactive_winbar = {},
	extensions = {}
}
require('glow').setup({
	install_path = "~/bin"
})
require("mason-lspconfig").setup({
	ensure_installed = {
		"bashls",
		"clangd",
		"lua_ls",
		"pylsp"
	}
})
require("ibl").setup()


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


-- ==== Keybinds ====
vim.api.nvim_set_keymap('n', '<C-t>', ':tabnew<CR>', { noremap = true })

-- ==== Startup ====
-- vim.cmd("autocmd BufWrite * mkview")
-- vim.cmd("autocmd BufRead * silent! loadview")
vim.cmd("autocmd BufWinLeave *.* mkview")				-- Save folds
vim.cmd("autocmd BufWinEnter *.* silent! loadview")		-- Load folds

vim.cmd("colorscheme palenight")
vim.cmd("set number")		-- Line numbers
vim.cmd("set hidden")		-- Allows switching buffer without saving
vim.cmd("set nofoldenable")	-- Disable folds at file open
-- vim.cmd("highlight Normal ctermbg=none")	-- Make background transparent
vim.cmd("highlight LineNr ctermfg=242")		-- Allows line numbers to be more visible

