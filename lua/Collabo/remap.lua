vim.keymap.set("n", "<leader>q", vim.cmd.Ex)  -- Weist die Funktion Ex zu

-- move highlighted line up/down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- keep copy in clipboard
vim.keymap.set("x", "<leader>p", [["_dP]])

-- replace current word
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- split screen

-- Open/Close splits screen, based on if there is already one
vim.keymap.set("n", "<leader>v", function()
    local window_count = #vim.api.nvim_list_wins()
    if window_count == 1 then
        vim.cmd("wincmd v")
        vim.cmd("wincmd l")
    else
        vim.cmd("wincmd l") 
        vim.cmd("wincmd q")
    end
end, { desc = "Move focus to the left window or close the right window" })

-- move between splits
vim.keymap.set("n", "<leader>h", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<leader>l", "<C-w><C-l>", { desc = "Move focus to the right window" })

vim.api.nvim_create_autocmd('TextYankPost', {
    desc = 'Highlight when yanking (copying) text',
    group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
    callback = function()
        vim.highlight.on_yank()
    end,
})

vim.keymap.set("v", "#", function()
  vim.cmd.norm('gc')
end)
