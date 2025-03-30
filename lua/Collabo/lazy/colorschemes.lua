return {
    {
        "catppuccin/nvim",
        priority = 1000,
        config = function()
            require("catppuccin").setup({
                color_overrides = {
                    mocha = {
                        base = "#14161B",
                    },
                },
            })
            vim.cmd([[ colorscheme catppuccin-mocha ]])
        end,
    },
}
