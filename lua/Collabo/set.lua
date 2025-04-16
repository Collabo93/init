vim.g.mapleader = " "
vim.g.undotree_DiffCommand = "FC"

-- line relative numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- os and vim have synced clipboard
vim.opt.clipboard = "unnamedplus"

-- Sgin colum on
vim.opt.signcolumn = "yes"

-- only split right
vim.opt.splitright = true
vim.opt.splitbelow = false

-- highlight current line
vim.opt.cursorline = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("USERPROFILE") .. "\\.vim\\undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

local default_path = vim.fn.expand("~/AppData/Local/nvim")
vim.api.nvim_set_current_dir(default_path)
