# Neovim Configuration

A custom Neovim setup I use on a daily basis. This repository mainly serves as my personal reference for the setup steps.

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

---

### 2. Install Nerd Fonts

Download and install any [Nerd Font](https://www.nerdfonts.com/font-downloads) of your choice.  
Make sure to set it as the font in your terminal for proper icon rendering.

---

### 3. Start Neovim

Open Neovim:

```bash
nvim
```

Wait until **Mason** automatically installs all required language servers and tools.

---

### 4. Install Node.js Dependencies

After Mason has finished:

```bash
cd %LOCALAPPDATA%/nvim       # Windows
# or
cd ~/.config/nvim             # Linux

npm install
```

---

### 5. Windows Environment Variables

For Windows users, make sure to add the following to your system environment variables:

1. **MinGW64** – Download [MinGW64](https://winlibs.com/) and add the `mingw64\bin` folder to your `PATH`, e.g.:

    ```
    C:\env_vars\mingw64\bin
    ```

2. **Ripgrep** – Download [Ripgrep](https://github.com/BurntSushi/ripgrep/releases) and add its folder to your `PATH`, e.g.:

    ```
    C:\env_vars\ripgrep
    ```

After updating the environment variables, restart your terminal.

---

### 6. Customize Your Settings

You can customize the configuration files to fit your preferences:

#### **6.1 Default Path**

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

---

#### **6.2 Dashboard Customization**

You can change the displayed repositories and the dashboard image:

- **Windows:** `%LOCALAPPDATA%\nvim\lua\Collabo\lazy\snacks.lua`
- **Linux:** `~/.config/nvim/lua/Collabo/lazy/snacks.lua`

1. **Change the Dashboard Image:**

    ```lua
    cmd = "cmd /C type %LOCALAPPDATA%\\nvim\\lua\\Collabo\\dashboard_img\\ascii-art-try.ans",
    ```

    Replace the `.ans` file with your own image if desired.

2. **Add Your Own Repositories:**

    ```lua
    dirs = {
        "%LOCALAPPDATA%\\nvim",  -- Add more paths here
    }
    ```

    For Linux, adjust the path accordingly (e.g., `~/.config/nvim`).

---

### 7. Project-Specific Configuration

Copy the following configuration files into each of your projects to ensure consistent code formatting:

- `eslint.config.js`
- `.prettierrc`

---

## Done!

Restart Neovim and enjoy your customized setup!
