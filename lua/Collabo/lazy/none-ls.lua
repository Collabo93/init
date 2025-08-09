return {
    "nvimtools/none-ls.nvim",
    dependencies = {
        "nvimtools/none-ls-extras.nvim",
    },
    config = function()
        local null_ls = require("null-ls")
        null_ls.setup({
            sources = {
                null_ls.builtins.formatting.prettier.with({
                    filetypes = {
                        "typescript",
                        "javascript",
                        "typescriptreact",
                        "javascriptreact",
                        "tsx",
                        "jsx",
                        "css",
                        "scss",
                        "less",
                        "html",
                        "json",
                        "yaml",
                        "markdown",
                        "graphql",
                        "php",
                    },
                }),
                null_ls.builtins.formatting.stylua,
                null_ls.builtins.code_actions.gitsigns,
            },
        })
    end,
}
