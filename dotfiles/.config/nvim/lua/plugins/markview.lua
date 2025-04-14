return {
    "OXY2DEV/markview.nvim",
    lazy = false,      -- Recommended
    -- ft = "markdown" -- If you decide to lazy-load anyway

    dependencies = {
        "nvim-treesitter/nvim-treesitter",
        "nvim-tree/nvim-web-devicons"
    },

	config = function()
		require("markview").setup({
			headings = require("markview.presets").headings.glow_labels,
			preview = {
				modes = { "n", "i", "no", "c" },
				hybrid_modes = { "i" },

				-- This is nice to have
				callbacks = {
					on_enable = function (_, win)
						vim.wo[win].conceallevel = 2;
						vim.wo[win].concealcursor = "nc";
					end
				}
			},
		})
	end
}

