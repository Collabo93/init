-- Exit current file and navigate cursor to it
vim.keymap.set("n", "<leader>q", function()
    local current_file = vim.fn.expand("%:t")
    vim.cmd.Ex()

    if current_file ~= "" then
        vim.fn.search(current_file)
    end
end)

-- move highlighted line up/down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- place screen and cursor in the middle of the screen
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- keep copy in clipboard
vim.keymap.set("x", "<leader>p", [["_dP]])

-- replace current word
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- jump to prev/next error
vim.keymap.set("n", "<leader>n", vim.diagnostic.goto_next)
vim.keymap.set("n", "<leader>N", vim.diagnostic.goto_prev)

-- Open/Close splits screen, based on if there is already one
vim.keymap.set("n", "<leader>v", function()
    vim.cmd("wincmd v")
    vim.cmd("wincmd l")
end, { desc = "Move focus to the left window or close the right window" })

-- move between splits
vim.keymap.set("n", "<leader>h", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<leader>l", "<C-w><C-l>", { desc = "Move focus to the right window" })

-- show a quick highlight when yanking
vim.api.nvim_create_autocmd("TextYankPost", {
    desc = "Highlight when yanking (copying) ",
    group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
    callback = function()
        vim.highlight.on_yank()
    end,
})

-- comment highlight
vim.keymap.set("v", "#", function()
    vim.cmd.norm("gc")
end)

-- bracket and brace selection
vim.keymap.set("n", "<leader>i", "vi(")
vim.keymap.set("n", "<leader>o", "vi{")
