return 	{
    "lukas-reineke/indent-blankline.nvim",
    -- main = "ibl",
    -- event = { "VeryLazy" },
    config = function()
        -- local hooks = require("ibl.hooks")
        -- hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
        -- 	vim.api.nvim_set_hl(0, "focus", { fg = "#7486bd" })
        -- 	vim.api.nvim_set_hl(0, "passive", { fg = "#41425e" })
        -- end)

        --require("ibl").setup({
        --	scope = { highlight = "focus", enabled = true },
        --	indent = { highlight = "passive" }
        --})
        require("ibl").setup({ scope = { enabled = true } })
        local hooks = require("ibl.hooks")
        hooks.register(hooks.type.SCOPE_HIGHLIGHT, hooks.builtin.scope_highlight_from_extmark)

        -- local highlight = {
        -- 	"RainbowRed",
        -- 	"RainbowYellow",
        -- 	"RainbowBlue",
        -- 	"RainbowOrange",
        -- 	"RainbowGreen",
        -- 	"RainbowViolet",
        -- 	"RainbowCyan",
        -- }
        -- local hooks = require("ibl.hooks")

        -- hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
        -- 	vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#E06C75" })
        -- 	vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#E5C07B" })
        -- 	vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#61AFEF" })
        -- 	vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#D19A66" })
        -- 	vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#98C379" })
        -- 	vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#C678DD" })
        -- 	vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#56B6C2" })
        -- end)

        -- hooks.register(hooks.type.SCOPE_HIGHLIGHT, hooks.builtin.scope_highlight_from_extmark)

        -- require("ibl").setup({
        -- 	scope = {
        -- 		highlight = highlight,
        -- 		show_start = false,
        -- 		show_end = false,
        -- 	}
        -- })
    end
}

