-- Enables smooth scroll
return {
	{
		"karb94/neoscroll.nvim",
		config = function ()
			require('neoscroll').setup({
				mappings = {
					'<C-u>',
					'<C-d>',
					'<C-b>',
					'<C-f>',
					'<C-y>',
					'<C-e>',
					'zt',
					'zz',
					'zb'
				},
				hide_cursor = false,          -- Hide cursor while scrolling
				stop_eof = true,             -- Stop at <EOF> when scrolling downwards
				respect_scrolloff = false,   -- Stop scrolling when the cursor reaches the scrolloff margin of the file
				cursor_scrolls_alone = true, -- The cursor will keep on scrolling even if the window cannot scroll further
				easing_function = nil,       -- Default easing function
				pre_hook = nil,              -- Function to run before the scrolling animation starts
				post_hook = nil,             -- Function to run after the scrolling animation ends
				performance_mode = false,    -- Disable "Performance Mode" on all buffers.
			})
			-- Neoscroll custom mappings
			local ns = require('neoscroll')
			local keymap = {
			  ["<C-u>"] = function() ns.ctrl_u({ duration = 100 }) end;
			  ["<C-d>"] = function() ns.ctrl_d({ duration = 100 }) end;
			  ["<C-b>"] = function() ns.ctrl_b({ duration = 150 }) end;
			  ["<C-f>"] = function() ns.ctrl_f({ duration = 150 }) end;
			  ["<C-y>"] = function() ns.scroll(-0.10, { move_cursor=false; duration = 100 }) end;
			  ["<C-e>"] = function() ns.scroll(0.10, { move_cursor=false; duration = 100 }) end;
			  ["zt"]    = function() ns.zt({ half_win_duration = 100 }) end;
			  ["zz"]    = function() ns.zz({ half_win_duration = 100 }) end;
			  ["zb"]    = function() ns.zb({ half_win_duration = 100 }) end;
			}
			local modes = { 'n', 'v', 'x' }
			for key, func in pairs(keymap) do
			  vim.keymap.set(modes, key, func)
			end
		end
	}
}

