return {
    "ellisonleao/glow.nvim",
    cmd = "Glow",
    -- config = true,             
    config = function()
        require('glow').setup({
            install_path = "~/bin"
        })
    end
}

