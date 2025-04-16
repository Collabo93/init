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
        vim.cmd("wincmd v")
        vim.cmd("wincmd l")
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

-- macro for console.log
local esc = vim.api.nvim_replace_termcodes("<Esc>", true, true, true)
vim.api.nvim_create_augroup("JSLogMacro", { clear = true })
vim.api.nvim_create_autocmd("FileType", {
    group= "JSLogMacro",
    pattern= { "javascript", "typescript"},
    callback = function()
        vim.fn.setreg("1", "yoconsole.log(': ');" .. esc .. "[F:<80><fd>5hpf)<80><fd>5hi<80>kr, " .. esc .. "[p")
    end,
})
