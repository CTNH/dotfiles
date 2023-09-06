vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
require("nvim-tree").setup()
-- Open tree ib start without focus
vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = (
	function()
		require("nvim-tree.api").tree.toggle({ focus = false })
	end
)})

require("nvim-tree.api").tree.toggle_gitignore_filter() 	-- Shows gitignore files too
vim.keymap.set('n', '<c-n>', ':NvimTreeFindFileToggle<CR>')

-- Autoclose if only tree is left
-- https://github.com/nvim-tree/nvim-tree.lua/wiki/Auto-Close
-- vim.api.nvim_create_autocmd("BufEnter", {
--   nested = true,
--   callback = function()
--     if #vim.api.nvim_list_wins() == 1 and require("nvim-tree.utils").is_nvim_tree_buf() then
--       vim.cmd "quit"
--     end
--   end
-- })

vim.api.nvim_create_autocmd("BufEnter", {
	group = vim.api.nvim_create_augroup("NvimTreeClose", {clear = true}),
		pattern = "NvimTree_*",
		callback = function()
			local layout = vim.api.nvim_call_function("winlayout", {})
			if layout[1] == "leaf" and vim.api.nvim_buf_get_option(vim.api.nvim_win_get_buf(layout[2]), "filetype") == "NvimTree" and layout[3] == nil then
				vim.cmd("confirm quit")
			end
		end
})
