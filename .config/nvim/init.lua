local o = vim.o
local g = vim.g

o.clipboard = "unnamedplus"

o.number = true

vim.opt.numberwidth = 1

o.swapfile = false

require("plugins")

local time = os.date("*t")
if time.hour < 6 or time.hour >= 17 then
    vim.cmd([[set background=dark]])
else
    vim.cmd([[set background=light]])
end

vim.opt.termguicolors = true
vim.cmd [[colorscheme space-nvim]]

vim.cmd([[
function! s:build_quickfix_list(lines)
  call setqflist(map(copy(a:lines), '{ "filename": v:val }'))
  copen
  cc
endfunction

let g:fzf_action = {
  \ 'ctrl-q': function('s:build_quickfix_list'),
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

let $FZF_DEFAULT_OPTS = '--bind ctrl-a:select-all'

function! RipgrepFzf(query, fullscreen)
  let command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case --fixed-strings -- %s || true'
  let initial_command = printf(command_fmt, shellescape(a:query))
  let reload_command = printf(command_fmt, '{q}')
  let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
  call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
endfunction

command! -nargs=* -bang RG call RipgrepFzf(<q-args>, <bang>0)

]])

local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", builtin.git_files, {})

vim.api.nvim_set_keymap("n", "<Leader><Leader>",
                        ":call ElixirAlternateFile()<CR>",
                        {noremap = true, silent = true})

vim.cmd([[
let g:test#echo_command = 0

let test#python#runner = 'pytest'

if exists('$TMUX')
  let g:test#preserve_screen = 1
  let g:test#strategy = 'vimux'
endif
]])

g.markdown_fenced_languages = {"python", "elixir", "bash", "dockerfile"}

require"nvim-treesitter.configs".setup {
    ensure_installed = {"heex", "python", "markdown"},
    sync_install = true,
    highlight = {enable = true, additional_vim_regex_highlighting = false},
    refactor = {
        highlight_definitions = {enable = true, clear_on_cursor_move = true},
        highlight_current_scope = {enable = true},
        smart_rename = {enable = true, keymaps = {smart_rename = "grr"}}
    }
}

local lsp = require("lsp-zero")

lsp.preset("recommended")

lsp.ensure_installed({
    "dockerls", "jsonls", "elixirls", "pylsp", "yamlls", "lua_ls", "ltex",
    "clangd", "gopls"
})

lsp.nvim_workspace()

lsp.setup()

require"lsp_signature".setup()

require("gitsigns").setup {
    on_attach = function(bufnr)
        local gs = package.loaded.gitsigns

        local function map(mode, l, r, opts)
            opts = opts or {}
            opts.buffer = bufnr
            vim.keymap.set(mode, l, r, opts)
        end

        -- Navigation
        map("n", "]c", function()
            if vim.wo.diff then return "]c" end
            vim.schedule(function() gs.next_hunk() end)
            return "<Ignore>"
        end, {expr = true})

        map("n", "[c", function()
            if vim.wo.diff then return "[c" end
            vim.schedule(function() gs.prev_hunk() end)
            return "<Ignore>"
        end, {expr = true})

        -- Actions
        map({"n", "v"}, "<leader>hs", ":Gitsigns stage_hunk<CR>")
        map({"n", "v"}, "<leader>hr", ":Gitsigns reset_hunk<CR>")
        map("n", "<leader>hS", gs.stage_buffer)
        map("n", "<leader>hu", gs.undo_stage_hunk)
        map("n", "<leader>hR", gs.reset_buffer)
        map("n", "<leader>hp", gs.preview_hunk)
        map("n", "<leader>hb", function() gs.blame_line {full = true} end)
        map("n", "<leader>tb", gs.toggle_current_line_blame)
        map("n", "<leader>hd", gs.diffthis)
        map("n", "<leader>hD", function() gs.diffthis("~") end)
        map("n", "<leader>td", gs.toggle_deleted)

        -- Text object
        map({"o", "x"}, "ih", ":<C-U>Gitsigns select_hunk<CR>")
    end
}

require"gitlinker".setup()

require("Comment").setup()

require("copilot").setup({
    suggestion = {enabled = false},
    panel = {enabled = false},
    server_opts_overrides = {settings = {enable = false}}
})

require("copilot_cmp").setup()

vim.api.nvim_set_hl(0, "CmpItemKindCopilot", {fg = "#6CC644"})

local cmp = require("cmp")

cmp.setup({
    sources = {{name = "copilot"}, {name = "nvim_lsp"}},
    mapping = {
        ["<CR>"] = cmp.mapping.confirm({
            behavior = cmp.ConfirmBehavior.Replace,
            select = false
        })
    }
})

require("copilot_status").setup()

require("lualine").setup {
    sections = {
        lualine_x = {
            require("copilot_status").status_string, "encoding", "fileformat",
            "filetype"
        }
    }
}
