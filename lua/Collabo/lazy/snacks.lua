local function buildRgCmd(opts)
    local expression = "(" .. table.concat(opts.sign_list, "|") .. "):"

    if opts.match_comment_symbols then
        expression = [[(]]
        .. table.concat(opts.comment_symbols, "|")
        .. [[)\s*(]]
        .. table.concat(opts.sign_list, "|")
        .. [[):\s*]]
    end

    local rg_command = "rg -g '!{**/node_modules/*,**/.git/*}' -w '"
    .. expression
    .. "' "
    .. table.concat(opts.dirs, " ")
    .. " --hidden --follow --sortr modified --no-heading --color never --with-filename --line-number --column"

    local file = io.open("currEx.txt", "w")  -- Öffnet die Datei im Schreibmodus
    file:write(rg_command)  -- Schreibt den String in die Datei
    file:close()

    -- rg_command = [[rg -g "!**/node_modules/*,!**/.git/*" -w "(--|//|#|/\\*)\\s*(todo|ERROR|FIX|FIXME|BUG):\\s*" "%USERPROFILE%\AppData\local\nvim" --hidden --follow --sortr modified --no-heading --color never --with-filename --line-number --column]]
    rg_command = [[rg -w "todo" "C:/Users/bless/AppData/Local/nvim"]]

    -- working on console with :!
    -- rg -w "todo" "C:\\Users\\bless\\AppData\\Local\\nvim"
    return rg_command
end

local function writeToFile(txt)
    local file = io.open("example.txt", "w")  -- Datei im Schreibmodus öffnen
    if not file then
        print("Fehler: Datei konnte nicht geöffnet werden.")
        return
    end

    local txt
    if type(data) == "table" then
        txt = vim.inspect(data)  -- Konvertiert die Tabelle in einen lesbaren String
        print(txt)
    else
        txt = tostring(data)  -- Falls es ein String oder eine Zahl ist
    end

    file:write(txt)  -- Schreibt den String in die Datei
    file:close()
    print("Daten wurden erfolgreich in example.txt gespeichert.")
end

local function getTodos(opts)
    if next(opts.sign_list) == nil then
        return {}
    end

    local rg_command = buildRgCmd(opts)
    local rg_res = vim.fn.systemlist(rg_command)

    writeToFile(rg_res)
    local todos = {}

    local todo_count = 0
    for i, line in pairs(rg_res) do
        -- todo_count = todo_count + 1
        if todo_count == 1 then break end
        local filename, row, col, text = line:match("^(.+):(%d+):(%d+):(.*)$")
        local sign_sym = ""

        for _, sign_s in ipairs(opts.sign_list) do
            local start_pos, end_pos = text:find(sign_s .. ":")
            if start_pos then
                sign_sym = text:sub(start_pos, end_pos)
                text = text:sub(end_pos + 1)
            end
        end

        local todo = {
            index = i + 5 ~= 10 and i + 5 or 0,
            file = filename:match("^%s*(.-)%s*$"),
            line = row,
            column = col,
            sign = sign_sym,
            desc = text:match("^%s*(.-)%s*$"),
        }
        table.insert(todos, todo)

        if todo_count == opts.limit then
            break
        end
    end

    return todos
end

return {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    opts = {
        dashboard = {
            width = 100,
            pane_gap = 20,
            row = nil,
            autokeys = "1234567890abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ",
            preset = {
                keys = {
                    {
                        { key = "n", hidden = true, action = ":ene | startinsert" },
                        { key = "o", hidden = true, action = ":Oil --float" },
                        { key = "f", hidden = true, action = ":lua Snacks.dashboard.pick('files')" },
                        { key = "r", hidden = true, action = ":lua Snacks.dashboard.pick('oldfiles')" },
                        { key = "g", hidden = true, action = ":lua Snacks.dashboard.pick('live_grep')" },
                        { key = "s", hidden = true, section = "session" },
                        { key = "L", hidden = true, action = ":Lazy", enabled = package.loaded.lazy ~= nil },
                        { key = "q", hidden = true, action = ":qa", enabled = package.loaded.lazy ~= nil },
                    },
                },
            },
            formats = {
                key = { "" },
                file = function(item)
                    return {
                        { item.key, hl = "key" },
                        { " " },
                        { item.file:sub(2):match("^(.*[/])"), hl = "NonText" },
                        { item.file:match("([^/]+)$"), hl = "Normal" },
                    }
                end,
                icon = { "" },
            },
            sections = {
                -- hidden
                { section = "keys" },
                -- not hidden
                {
                    pane = 1,
                    section = "terminal",
                    cmd = "img2art ~/AppData/local/nvim/lua/Collabo/dashboard_img/hq.png --threshold 50 --scale .34 --quant 16 --with-color",
                    height = 27,
                    width = 100,
                    indent = 20,
                },
                {
                    pane = 2,
                    indent = 21,
                    {
                        { text = "" },
                        {
                            text = {
                                { "n ", hl = "key" },
                                { "New file", hl = "Normal" },
                                { "", width = 10 },
                                { "r ", hl = "key" },
                                { "Recent files", hl = "Normal" },
                            },
                        },
                        { text = "", padding = 1 },
                        {
                            text = {
                                { "o ", hl = "key" },
                                { "Open file", hl = "Normal" },
                                { "", width = 9 },
                                { "g ", hl = "key" },
                                { "Grep text", hl = "Normal" },
                            },
                        },
                        { text = "", padding = 1 },
                        {
                            text = {
                                { "f ", hl = "key" },
                                { "Find files", hl = "Normal" },
                                { "", width = 8 },
                                { "s ", hl = "key" },
                                { "Restore session", hl = "Normal" },
                            },
                        },
                    },
                    { text = "", padding = 2 },
                    { title = "Projects", padding = 1, indent = 21 },
                    { section = "projects", limit = 5, padding = 2, indent = 20 },
                    { title = "TODO List", padding = 1, indent = 21 },
                    {
                        indent = 21,
                        function()
                            local todo_opts = {
                                limit = 5,
                                match_comment_symbols = true,
                                comment_symbols = { "--", "//", "#", "/\\*" }, -- we need to escape "*", otherwise it'll match any character in between
                                dirs = { "~/.config", "~/Code" },
                                sign_list = { "TODO", "ERROR", "FIX", "FIXME", "BUG" },
                            }
                            local todos = getTodos(todo_opts)

                            return vim.tbl_map(function(todo)
                                return {
                                    autokey = true,
                                    text = {
                                        { tostring(todo.index) .. " ", hl = "key" },
                                        { todo.sign .. string.rep(" ", 7 - #todo.sign), hl = "NonText" },
                                        {
                                            (todo.desc:len() > 35) and todo.desc:sub(1, 35) .. "" or todo.desc,
                                            hl = "Normal",
                                        },
                                    },
                                    action = function()
                                        vim.fn.chdir(todo.file:match("^(.*[\\/])[^\\/]+$")) -- :cd into dir
                                        vim.cmd("edit " .. todo.file) -- open file
                                        vim.cmd(todo.line) -- go to line
                                    end,
                                }
                            end, todos)
                        end,
                    },
                },
            },
        },
        bigfile = { enabled = true },
        input = { enabled = true },
        notifier = { enabled = true },
        quickfile = { enabled = true },
        statuscolumn = { enabled = true },
        words = { enabled = true },
    },
    config = function(_, opts)
        require("snacks").setup(opts)
        vim.api.nvim_set_hl(0, "SnacksDashboardKey", { fg = "#5ceef6" })
        vim.api.nvim_set_hl(0, "SnacksDashboardTitle", { fg = "#c49aee" })
    end,
}
