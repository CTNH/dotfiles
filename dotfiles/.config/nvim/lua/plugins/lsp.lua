-- LSP Manager
return {
	'hrsh7th/cmp-nvim-lsp',				-- nvim-cmp source for builtin LSP client
	{
		'neovim/nvim-lspconfig',
		dependencies = {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
		},
		config = function()
			require("mason").setup()	-- Must be called before mason-lspconfig
			require("mason-lspconfig").setup({
				ensure_installed = {
					"bashls",
					"clangd",
					"gopls",
					"jdtls",
					"lua_ls",
					"pylsp",
					"ts_ls",
				},
				handlers = {
					function (server_name)	-- Optional default handler
						require("lspconfig")[server_name].setup {
							capabilities = require('cmp_nvim_lsp').default_capabilities()
						}
					end
				}
			})
		end
	},
}

