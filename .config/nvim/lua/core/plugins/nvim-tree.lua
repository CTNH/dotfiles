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
vim.api.nvim_create_autocmd("BufEnter", {
  nested = true,
  callback = function()
    if #vim.api.nvim_list_wins() == 1 and require("nvim-tree.utils").is_nvim_tree_buf() then
      vim.cmd "quit"
    end
  end
})

