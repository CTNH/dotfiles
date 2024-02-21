return {
	"shellRaining/hlchunk.nvim",
	event = { "UIEnter" },
	config = function()
		require("hlchunk").setup({
			indent = {
				enable = true,
				use_treesitter = false
			}
		})
	end
}

