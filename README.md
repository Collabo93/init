# Neovim Configuration

A custom Neovim setup I use on a daily basis. This repository mainly serves as my personal reference for the setup steps.

![Dashboard Screenshot](https://raw.githubusercontent.com/Collabo93/init/refs/heads/master/dashboard.png)  
![File Editing Screenshot](https://raw.githubusercontent.com/Collabo93/init/refs/heads/master/file.png)

## Features

This section lists the plugins and language servers used in this Neovim configuration to enhance functionality and development experience.

- **autopairs**: Automatically pairs brackets, quotes, and other characters. [Link](https://github.com/windwp/nvim-autopairs)
- **catppuccin**: pastel theme [Link](https://github.com/catppuccin/nvim)
- **copilot**: AI-powered code completion. [Link](https://github.com/github/copilot.vim)
- **flash**: Enhances search and navigation with visual cues. [Link](https://github.com/folke/flash.nvim)
- **fugitive**: Git integration for Neovim. [Link](https://github.com/tpope/vim-fugitive)
- **gitsigns**: Displays Git signs in the gutter and provides Git-related utilities. [Link](https://github.com/lewis6991/gitsigns.nvim)
- **lualine**: Customizable status line for Neovim. [Link](https://github.com/nvim-lualine/lualine.nvim)
- **none-ls**: Provides LSP-like diagnostics and formatting using non-LSP tools. [Link](https://github.com/nvimtools/none-ls.nvim)
- **snacks**: A collection of small QoL plugins for Neovim. [Link](https://github.com/folke/snacks.nvim)
- **telescope**: Fuzzy finder for files, buffers, and more. [Link](https://github.com/nvim-telescope/telescope.nvim)
- **todo**: Highlights and manages TODO comments. [Link](https://github.com/folke/todo-comments.nvim)
- **treesitter**: Syntax highlighting and code parsing. [Link](https://github.com/nvim-treesitter/nvim-treesitter)
- **undotree**: Visualizes the undo history. [Link](https://github.com/mbbill/undotree)
- **nvim-lspconfig**: Configurations for Neovim's built-in LSP client. [Link](https://github.com/neovim/nvim-lspconfig)
- **mason-tool-installer.nvim**: Automates installation of Mason-managed tools. [Link](https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim)
- **conform.nvim**: Lightweight formatting plugin for Neovim. [Link](https://github.com/stevearc/conform.nvim)
- **mason.nvim**: Manages external editor tooling like LSP servers and formatters. [Link](https://github.com/williamboman/mason.nvim)
- **mason-lspconfig.nvim**: Bridges Mason with nvim-lspconfig for seamless LSP setup. [Link](https://github.com/williamboman/mason-lspconfig.nvim)
- **cmp-nvim-lsp**: LSP source for nvim-cmp completion. [Link](https://github.com/hrsh7th/cmp-nvim-lsp)
- **cmp-buffer**: Buffer source for nvim-cmp completion. [Link](https://github.com/hrsh7th/cmp-buffer)
- **cmp-path**: Filesystem path source for nvim-cmp completion. [Link](https://github.com/hrsh7th/cmp-path)
- **cmp-cmdline**: Command-line source for nvim-cmp completion. [Link](https://github.com/hrsh7th/cmp-cmdline)
- **nvim-cmp**: Completion engine for Neovim. [Link](https://github.com/hrsh7th/nvim-cmp)
- **LuaSnip**: Snippet engine for Neovim. [Link](https://github.com/L3MON4D3/LuaSnip)
- **cmp_luasnip**: LuaSnip source for nvim-cmp completion. [Link](https://github.com/saadparwaiz1/cmp_luasnip)
- **fidget.nvim**: Displays LSP progress notifications. [Link](https://github.com/j-hui/fidget.nvim)
- **eslint**: Linting for JavaScript/TypeScript. [Link](https://github.com/eslint/eslint)
- **intelephense**: PHP language server. [Link](https://intelephense.com)
- **lua-language-server (lua_ls)**: Lua language server. [Link](https://github.com/LuaLS/lua-language-server)
- **prettier**: Code formatter for multiple languages. [Link](https://github.com/prettier/prettier)
- **plugin-php**: Prettier support for PHP. [Link](https://github.com/prettier/plugin-php)
- **stylua**: Lua code formatter. [Link](https://github.com/JohnnyMorganz/StyLua)
- **typescript-language-server**: TypeScript/JavaScript language server. [Link](https://github.com/typescript-language-server/typescript-language-server)

## Requirements

The following tools are required to use this Neovim configuration:

- **Neovim >= 0.10.0**: The core editor. [Link](https://github.com/neovim/neovim/releases)
- **npm**: Node.js package manager for installing dependencies. [Link](https://nodejs.org/)
- **Environment Variables**:
    - **MinGW64**: Download [MinGW64](https://winlibs.com/) and add the `mingw64\bin` folder to your `PATH`, e.g., `C:\env_vars\mingw64\bin`.
    - **Ripgrep**: Download [Ripgrep](https://github.com/BurntSushi/ripgrep/releases) and add its folder to your `PATH`, e.g., `C:\env_vars\ripgrep`.
- **Nerd Fonts** (optional, but recommended): Download and install any [Nerd Font](https://www.nerdfonts.com/font-downloads) and set it as the font in your terminal for proper icon rendering.

## Shortcuts

The following table lists key mappings for this Neovim configuration:

| Shortcut    | Mode   | Description                                 |
| ----------- | ------ | ------------------------------------------- |
| `n`         | Normal | Next search result and center cursor        |
| `N`         | Normal | Previous search result and center cursor    |
| `J`         | Visual | Move highlighted line down                  |
| `K`         | Visual | Move highlighted line up                    |
| `#`         | Visual | Comment highlighted lines                   |
| `<C-d>`     | Normal | Scroll down and center cursor               |
| `<C-u>`     | Normal | Scroll up and center cursor                 |
| `<C-a>`     | Normal | Select all text in the current buffer       |
| `<leader>q` | Normal | Exit current file                           |
| `<leader>s` | Normal | Replace current word in file                |
| `<leader>n` | Normal | Jump to next diagnostic error               |
| `<leader>N` | Normal | Jump to previous diagnostic error           |
| `<leader>v` | Normal | Open or close vertical split and move focus |
| `<leader>h` | Normal | Move focus to the left window               |
| `<leader>l` | Normal | Move focus to the right window              |
| `<leader>i` | Normal | Select inside parentheses                   |
| `<leader>o` | Normal | Select inside braces                        |
| `<leader>w` | Normal | Format current buffer                       |
| `<leader>u` | Normal | Toggle Undotree                             |
| `<leader>p` | Visual | Paste without overwriting clipboard         |

## Installation

### 1. Clone the Repository

#### **Windows**

If you already use Neovim, delete or rename the `nvim` and `nvim-data` folders.  
If not, create an `nvim` directory.

Clone this repository into your Neovim config folder:

```bash
git clone https://github.com/Collabo93/init.git %LOCALAPPDATA%/nvim
```

#### **Linux**

Clone into the Neovim config directory:

```bash
git clone https://github.com/Collabo93/init.git ~/.config/nvim
```

### 2. Start Neovim

Open Neovim:

```bash
nvim
```

Wait until **Mason** automatically installs all required language servers and tools.

### 3. Install Node.js Dependencies

After Mason has finished:

```bash
cd %LOCALAPPDATA%/nvim       # Windows
# or
cd ~/.config/nvim             # Linux

npm install
```

### 4. Customize Your Settings

You can customize the configuration files to fit your preferences:

#### **4.1 Default Path**

Change the default path Neovim opens in:

- **Windows:**  
  `%LOCALAPPDATA%\nvim\lua\Collabo\set.lua`

    Default entry:

    ```lua
    local default_path = vim.fn.expand("~/AppData/local/nvim")
    ```

- **Linux:**  
  `~/.config/nvim/lua/Collabo/set.lua`

    Change it to any desired directory.

#### **4.2 Directory Setup**

All directory-related settings, such as the default startup directory, project directories for the ToDo list, and the Undotree directory, can be configured in:

- **Windows and Linux:** `%LOCALAPPDATA%\nvim\settings.lua` or `~/.config/nvim/settings.lua`

    Default configuration:

    ```lua
    local settings = {
        start_dir = vim.fn.expand("~/AppData/local/nvim"),
        project_dirs = {
            os.getenv("LocalAppData") .. "/nvim",
            -- os.getenv("USERPROFILE") .. "/Documents",
        },
        undotree_dir = os.getenv("USERPROFILE") .. "\\.vim\\undodir",
    }
    return settings
    ```

    Adjust the `start_dir` for the default Neovim startup directory, `project_dirs` for repositories to search for TODOs, and `undotree_dir` for the Undotree history storage.

#### **4.3 copilot**

If you want to use GitHub Copilot, invoke the command `:Copilot setup` in Neovim to set up your GitHub account.

#### **4.4 Background Image**

By default, this setup has a transparent background to support a terminal background image. You have two options:

a) **Set a background image**  
 Example images are in this directory:

- **Windows:** `%LOCALAPPDATA%\nvim\lua\Collabo\dashboard_img\`
- **Linux:** `~/.config/nvim/lua/Collabo/lazy/dashboard_img`

b) **Deactivate the transparent background**

- **Windows:** `%LOCALAPPDATA%\nvim\lua\Collabo\lazy\colorschemes.lua`
- **Linux:** `~/.config/nvim/lua/Collabo/lazy/colorschemes.lua`

Comment or delete this line:

```lua
transparent_background = true,
```

### 5. Project-Specific Configuration

Copy the following configuration files into each of your projects to ensure consistent code formatting:

- `eslint.config.js`
- `.prettierrc`

## Done!

Restart Neovim, and you're done!
