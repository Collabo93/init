return {
    {
        "catppuccin/nvim",
        priority = 1000,
        config = function()
            require("catppuccin").setup({
                transparent_background = true,
                color_overrides = {
                    mocha = {
                        base = "#14161B",
                    },
                },
                float = {
                    transparent = true,
                },
            })
            vim.cmd([[ colorscheme catppuccin-mocha ]])
        end,
    },
}
