-- LSP Manager
return {
	'hrsh7th/cmp-nvim-lsp',				-- nvim-cmp source for builtin LSP client
	{
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
					"gopls",
					"jdtls",
					"lua_ls",
					"pylsp",
				}
			})
		end
	},
	{
		'neovim/nvim-lspconfig',
		config = function()
			local capabilities = require('cmp_nvim_lsp').default_capabilities()

			require("lspconfig").bashls.setup 	{ capabilities = capabilities }
			require("lspconfig").clangd.setup 	{ capabilities = capabilities }
			require("lspconfig").gopls.setup 	{ capabilities = capabilities }
			require("lspconfig").jdtls.setup 	{ capabilities = capabilities }
			require("lspconfig").lua_ls.setup 	{ capabilities = capabilities }
			require("lspconfig").pylsp.setup 	{ capabilities = capabilities }
		end
	},
}

