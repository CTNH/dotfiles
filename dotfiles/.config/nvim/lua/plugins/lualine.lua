-- Status bar / Tabline
return {
    {
		'nvim-lualine/lualine.nvim',
		dependencies = { 'nvim-tree/nvim-web-devicons' },
		config = function()
			local lualineTheme = require'lualine.themes.onedark'
			lualineTheme = require'lualine.themes.material'
			lualineTheme.normal.a.bg = '#4078f2'
			lualineTheme.insert.a.bg = '#50a14f'
			local function getWordCount()
				return tostring(vim.fn.wordcount().words)
			end
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
					lualine_x = {{getWordCount}, 'filetype', 'encoding', 'fileformat'},
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
				-- tabline = {
				-- 	lualine_a = {'buffers'},
				-- 	lualine_b = {},
				-- 	lualine_c = {},
				-- 	lualine_x = {},
				-- 	lualine_y = {},
				-- 	lualine_z = {'tabs'}
				-- },
				tabline = {
				},
				winbar = {},
				inactive_winbar = {},
				extensions = {}
			}
		end
	},
}

