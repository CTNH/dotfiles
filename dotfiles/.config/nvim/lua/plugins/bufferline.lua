return {
	'akinsho/bufferline.nvim',
	version = "*",
	dependencies = 'nvim-tree/nvim-web-devicons',
	config = function ()
		require('bufferline').setup({
			options = {
				indicator = { style = 'underline' },
				separator_style = { '', '' },
				-- separator_style = 'slant',
				show_close_icons = false,
				hover = {
					enabled = true,
					delay = 200,
					reveal = {'close'}
				},
			},
		})
	end
}

