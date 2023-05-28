require("mason").setup()
require("mason-lspconfig").setup()

local capabilities = require('cmp_nvim_lsp').default_capabilities()

require("lspconfig").lua_ls.setup {
	capabilities = capabilities
}
require("lspconfig").clangd.setup {
	capabilities = capabilities
}
require("lspconfig").pylsp.setup {
	capabilities = capabilities
}
require("lspconfig").jdtls.setup {
	capabilities = capabilities
}
require("lspconfig").bashls.setup {
	capabilities = capabilities
}

-- 'K' to show
vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})

