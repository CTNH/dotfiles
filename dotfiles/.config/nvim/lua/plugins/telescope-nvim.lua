-- Fuzzy Finder
return {
	{
		'nvim-telescope/telescope.nvim',
		dependencies = { 'nvim-lua/plenary.nvim' },
		config = function()
			require('telescope').setup({
				pickers = {
					-- Show hidden files in find files
					find_files = {hidden = true}
				}
			})
		end
	},
}

