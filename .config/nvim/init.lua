local o = vim.o
local g = vim.g

o.clipboard = "unnamedplus"

o.number = true

vim.opt.numberwidth = 1

o.swapfile = false

local time = os.date("*t")
if time.hour < 6 or time.hour >= 18 then
    vim.cmd([[set background=dark]])
else
    vim.cmd([[set background=light]])
end

vim.opt.termguicolors = true

g.markdown_fenced_languages = {"python", "elixir", "bash", "dockerfile"}
