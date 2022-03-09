local o = vim.o

o.clipboard = "unnamedplus"

o.swapfile = false

require('plugins')

vim.opt.termguicolors = true
vim.api.nvim_command 'colorscheme rvcs'

local opts = {noremap = true, silent = true}
vim.api.nvim_set_keymap('n', '<space>e',
                        '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
vim.api.nvim_set_keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>',
                        opts)
vim.api.nvim_set_keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>',
                        opts)
vim.api.nvim_set_keymap('n', '<space>q',
                        '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)

local on_attach = function(client, bufnr)
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gD',
                                '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd',
                                '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K',
                                '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gi',
                                '<cmd>lua vim.lsp.buf.implementation()<CR>',
                                opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<C-k>',
                                '<cmd>lua vim.lsp.buf.signature_help()<CR>',
                                opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wa',
                                '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>',
                                opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wr',
                                '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>',
                                opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wl',
                                '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>',
                                opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>D',
                                '<cmd>lua vim.lsp.buf.type_definition()<CR>',
                                opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>rn',
                                '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>ca',
                                '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr',
                                '<cmd>lua vim.lsp.buf.references()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>f',
                                '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
end

local lsp_installer = require "nvim-lsp-installer"

local servers = {"dockerls"}

for _, name in pairs(servers) do
    local server_is_found, server = lsp_installer.get_server(name)
    if server_is_found and not server:is_installed() then
        print("Installing " .. name)
        server:install()
    end
end

for _, name in pairs(servers) do
    lsp_installer.on_server_ready(function(server)
        local opts = {
            on_attach = on_attach,
            flags = {debounce_text_changes = 150}
        }

        server:setup(opts)
    end)
end

local servers = {'jsonls'}
for _, lsp in pairs(servers) do
    require('lspconfig')[lsp].setup {
        on_attach = on_attach,
        flags = {debounce_text_changes = 150}
    }
end

require'lspconfig'.elixirls.setup {
    cmd = {"elixir-ls"},
    on_attach = on_attach,
    flags = {debounce_text_changes = 150}
}

require'nvim-treesitter.configs'.setup {
    ensure_installed = {"elixir"},

    sync_install = true,

    highlight = {enable = true, additional_vim_regex_highlighting = false}
}

require('telescope').load_extension('fzf')

vim.api.nvim_set_keymap('n', '<Leader>ff', ":Telescope find_files<CR>",
                        {noremap = true})
vim.api.nvim_set_keymap('n', '<Leader>fg', ":Telescope live_grep<CR>",
                        {noremap = true})

require('vgit').setup()

require('Comment').setup()

