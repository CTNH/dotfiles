-- Language parser for syntax highlighting
return {
    'nvim-treesitter/nvim-treesitter',
    build = ":TSUpdate",
    config = function()
        require("nvim-treesitter.configs").setup({
			ensure_installed = {
				"bash",
				"c",
				"cpp",
				"go",
				"java",
				"lua",
				"python",
				"markdown"
			},
            highlight = { enable = true },
            indent = { enable = true },
        })
    end,
}

