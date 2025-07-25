return {
    "nvim-telescope/telescope.nvim",

    tag = "0.1.5",

    dependencies = {
        "nvim-lua/plenary.nvim",
    },

    config = function()
        require("telescope").setup({
            defaults = {
                file_ignore_patterns = { "node_modules", "%.git/" }, -- <- ignoriert node_modules und .git
            },
        })

        local builtin = require("telescope.builtin")
        vim.keymap.set("n", "<leader>f", builtin.find_files, { desc = "Telescope find files" })
        vim.keymap.set("n", "<leader>e", function()
            builtin.grep_string({ search = vim.fn.input("Grep > ") })
        end)
    end,
}
