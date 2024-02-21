return {
	{
		'akinsho/toggleterm.nvim',
		version = "*",
		opts = {
			open_mapping = [[<c-`>]],
			-- size = 20,
			hide_numbers = true,
			persist_mode = true,
			persist_size = true,
			close_on_exit = true,
			start_in_insert = true,
			-- insert_mappings = false;
			-- horizontal | vertical | float
			direction = "float",
			-- shell = vim.o.shell,
			shell = "/usr/bin/zsh",
			float_opts = {
				border = "curved",
				winblend = 0,
			},
		}
	}
}

