-- change/add your projects here
local settings = require("settings")

local function buildRgCmd(opts)
    if vim.fn.executable("rg") == 0 then
        vim.notify("rg (ripgrep) not found! Skipping TODO search.", vim.log.levels.WARN)
        return ""
    end

    local expression = "(" .. table.concat(opts.todo_signs, "|") .. "):"

    if opts.match_comment_symbols then
        expression = [[(]]
            .. table.concat(opts.comment_symbols, "|")
            .. [[)\s*(]]
            .. table.concat(opts.todo_signs, "|")
            .. [[):\s*]]
    end

    local rg_command = 'rg -g "!{**/node_modules/*,**/.git/*}" -w "'
        .. expression
        .. '" '
        .. table.concat(opts.dirs, " ")
        .. " --hidden --follow --sortr modified --no-heading --color never --with-filename --line-number --column"

    return rg_command
end

local function getTodos(opts)
    if next(opts.todo_signs) == nil then
        return {}
    end

    local rg_command = buildRgCmd(opts)
    local rg_res = vim.fn.systemlist(rg_command)
    if vim.tbl_isempty(rg_res) then
        return { { text = { { "No TODOs found", hl = "NonText" } }, action = function() end } }
    end

    local todoStartIndex
    local projectsLimit = 5
    if #settings.project_dirs > projectsLimit then
        todoStartIndex = projectsLimit + 1
    else
        todoStartIndex = #settings.project_dirs
    end

    local todos = {}
    local todo_count = 0
    for i, line in pairs(rg_res) do
        local sign_sym = ""
        local filename, row, col, text = line:match("^(.+):(%d+):(%d+):(.*)$")
        if filename and row and col and text then
            todo_count = todo_count + 1

            for _, sign_s in ipairs(opts.todo_signs) do
                local start_pos, end_pos = text:find(sign_s .. ":")
                if start_pos then
                    sign_sym = text:sub(start_pos, end_pos)
                    text = text:sub(end_pos + 1)
                end
            end

            local todo = {
                index = i + todoStartIndex,
                file = filename,
                line = row,
                column = col,
                sign = sign_sym,
                desc = text:match("^%s*(.-)%s*$"),
            }
            table.insert(todos, todo)

            if todo_count == opts.limit then
                break
            end
        else
            vim.notify("Could not find one or more projects", vim.log.levels.WARN)
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
            width = 120,
            pane_gap = 20,
            row = 6,
            autokeys = "1234567890",
            formats = {
                key = { "" },
                file = function(item)
                    return {
                        { item.key,                           hl = "key" },
                        { " " },
                        { item.file:sub(2):match("^(.*[/])"), hl = "NonText" },
                        { item.file:match("([^/]+)$"),        hl = "Normal" },
                    }
                end,
                icon = { "" },
            },
            sections = {
                { section = "header",  pane = 1, padding = { 0, 2 } },
                { section = "startup", pane = 1, align = "center" },
                {
                    pane = 1,
                    indent = 0,
                    padding = { 0, 10 },
                    { text = "",          padding = 2 },
                    { title = "Projects", padding = 1, indent = 25, align = "left" },
                    {
                        section = "projects",
                        limit = 5,
                        padding = 2,
                        indent = 25,
                        align = "left",
                        dirs = settings.project_dirs,
                    },
                    {
                        title = "TODO List",
                        padding = 1,
                        indent = 25,
                        align = "left",
                    },
                    {
                        indent = 26,
                        align = "left",
                        function()
                            local todo_opts = {
                                limit = 5,
                                match_comment_symbols = true,
                                comment_symbols = { "--", "//", "#", "/\\*", "<!--" },
                                dirs = settings.project_dirs,
                                todo_signs = { "TODO", "ERROR", "FIX", "FIXME", "BUG" },
                            }

                            local todos = getTodos(todo_opts)
                            local maxChars = 58

                            return vim.tbl_map(function(todo)
                                if todo.sign == nil or #todo.sign == 0 then
                                    return {
                                        { text = { { "No TODOs found", hl = "NonText" } }, action = function() end },
                                    }
                                end
                                return {
                                    autokey = true,
                                    text = {
                                        { tostring(todo.index) .. " ",                  hl = "key" },
                                        { todo.sign .. string.rep(" ", 7 - #todo.sign), hl = "NonText" },
                                        {
                                            (todo.desc:len() > maxChars) and todo.desc:sub(1, maxChars) .. "..."
                                            or todo.desc,
                                            hl = "Normal",
                                        },
                                    },
                                    action = function()
                                        vim.fn.chdir(todo.file:match("^(.*[\\/])[^\\/]+$")) -- cd into directory
                                        vim.cmd("edit " .. todo.file) -- open file
                                        vim.cmd(todo.line)    -- go to line
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
        vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
        vim.api.nvim_set_hl(0, "FloatBorder", { bg = "none" })
    end,
}
