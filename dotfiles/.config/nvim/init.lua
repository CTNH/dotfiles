-- List of all plugins
local plugins = {
	-- Basic functional plugins
	{
		'nvim-tree/nvim-tree.lua',
	},
	'nvim-tree/nvim-web-devicons',
	'jiangmiao/auto-pairs',				-- Auto close parentheses
	{									-- Fuzzy Finder
		'nvim-telescope/telescope.nvim',
		dependencies = { 'nvim-lua/plenary.nvim' }
	},
	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		config = function()
			require("ibl").setup()
		end
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
		dependencies = { 'nvim-tree/nvim-web-devicons' },
		config = function()
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
		end
	},
	{									-- Tab bar
		'crispgm/nvim-tabline',
		dependencies = { 'nvim-tree/nvim-web-devicons' },
		config = function()
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
		end,
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
	{										-- LSP Manager
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"bashls",
					"clangd",
					"lua_ls",
					"pylsp"
				}
			})
		end
	},
	'hrsh7th/cmp-nvim-lsp',				-- nvim-cmp source for builtin LSP client
	'hrsh7th/nvim-cmp',					-- Completion Engine
	'saadparwaiz1/cmp_luasnip',			-- luasnip completion source for nvim-cmp
	"rafamadriz/friendly-snippets",		-- Preconfigured different lanaguage snippets
	{									-- Snippet engine
		"L3MON4D3/LuaSnip",
		dependencies = { "rafamadriz/friendly-snippets" },
	},
	{
		"ellisonleao/glow.nvim",
		cmd = "Glow",
		-- config = true,
		config = function()
			require('glow').setup({
				install_path = "~/bin"
			})
		end
	},
	{									-- Terminal in nvim
		'akinsho/toggleterm.nvim',
		version = "*",
		opts = {}
	},
	{'lervag/vimtex'},					-- LaTeX
	{									-- Smooth scroll
		"karb94/neoscroll.nvim",
		config = function ()
			require('neoscroll').setup({
				mappings = {
					'<C-u>',
					'<C-d>',
					'<C-b>',
					'<C-f>',
					'<C-y>',
					'<C-e>',
					'zt',
					'zz',
					'zb'
				},
				hide_cursor = false,          -- Hide cursor while scrolling
				stop_eof = true,             -- Stop at <EOF> when scrolling downwards
				respect_scrolloff = false,   -- Stop scrolling when the cursor reaches the scrolloff margin of the file
				cursor_scrolls_alone = true, -- The cursor will keep on scrolling even if the window cannot scroll further
				easing_function = nil,       -- Default easing function
				pre_hook = nil,              -- Function to run before the scrolling animation starts
				post_hook = nil,             -- Function to run after the scrolling animation ends
				performance_mode = false,    -- Disable "Performance Mode" on all buffers.
			})
			-- Neoscroll custom mappings
			require("neoscroll.config").set_mappings({
				["<C-u>"] = {'scroll', {'-vim.wo.scroll', 'true', '100'}},
				["<C-d>"] = {'scroll', { 'vim.wo.scroll', 'true', '100'}},
				['<C-b>'] = {'scroll', {'-vim.api.nvim_win_get_height(0)', 'true', '150'}},
				['<C-f>'] = {'scroll', { 'vim.api.nvim_win_get_height(0)', 'true', '150'}},
				['<C-y>'] = {'scroll', {'-0.10', 'false', '100'}},
				['<C-e>'] = {'scroll', { '0.10', 'false', '100'}},
				['zt']    = {'zt', {'100'}},
				['zz']    = {'zz', {'100'}},
				['zb']    = {'zb', {'100'}},
			})
		end
	},
	{
		'chentoast/marks.nvim',
		config = function()
			require('marks').setup()
		end
	},
	{
		'akinsho/toggleterm.nvim',
		version = "*",
		opts = {}
	},
}

-- Load plugins first as some keymaps uses plugins
require("core.plugin-manager")		-- Lazy plugin manager bootstrap
require("lazy").setup(plugins)

require("core.keymaps")

-- ==== Plugin Settings ====
require("core.plugins.lsp")				-- LSP
require("core.plugins.nvim-tree")		-- Nvim Tree
require("core.plugins.completions")		-- Autocomplete


vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.cursorline = true
-- Change cursor in normal & visual mode from block to line
vim.opt.guicursor = "c-sm:block,n-v-i-ci-ve:ver25,r-cr-o:hor20"


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

