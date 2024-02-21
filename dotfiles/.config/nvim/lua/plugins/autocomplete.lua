return {
	{
		'hrsh7th/nvim-cmp',					-- Completion Engine
		config = function()
			local cmp = require('cmp')		-- nvim-cmp
			require("luasnip.loaders.from_vscode").lazy_load()	-- VS Code style snippets

			cmp.setup({
				mapping = cmp.mapping.preset.insert({
					['<C-Space>'] = cmp.mapping.complete(),
					['<CR>'] = cmp.mapping.confirm({ select = true }),
				}),
				snippet = {
					expand = function(args)
						require('luasnip').lsp_expand(args.body)
					end
				},
				sources = cmp.config.sources(
					{
						{ name = 'nvim_lsp' },
						{ name = 'luasnip' }
					},
					{{ name = 'buffer' }}
				)
			})
		end
	},
	'saadparwaiz1/cmp_luasnip',			-- luasnip completion source for nvim-cmp
	"rafamadriz/friendly-snippets",		-- Preconfigured different lanaguage snippets
	{									-- Snippet engine
		"L3MON4D3/LuaSnip",
		dependencies = { "rafamadriz/friendly-snippets" },
	},
}

