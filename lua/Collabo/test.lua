-- local rg_command = [[rg -g "!{**/node_modules/*,**/.git/*}" -w "(--|//|#|/\*)\s*(todo|ERROR|FIX|FIXME|BUG):\s*" %USERPROFILE%\AppData\local\nvim --hidden --follow --sort modified --no-heading --color never --with-filename --line-number --column]]
local rg_command = [[rg -g "!**/node_modules/*,!**/.git/*" -w "(--|//|#|/\\*)\\s*(todo|ERROR|FIX|FIXME|BUG):\\s*" "%USERPROFILE%\\AppData\\local\nvim" --hidden --follow --sortr modified --no-heading --color never --with-filename --line-number --column]]
local rg_res = vim.fn.systemlist(rg_command)
vim.inspect(rg_res)
for _, line in ipairs(rg_res) do
  print(line)
end
