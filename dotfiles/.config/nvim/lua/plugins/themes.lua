return {
	'joshdick/onedark.vim',
	'drewtempelmeyer/palenight.vim',
	{
		'ribru17/bamboo.nvim',
		lazy = false,
		priority = 1000,
		config = function()
			require('bamboo').setup {}
			-- Enables theme
			require('bamboo').load()
		end,
	},
}

