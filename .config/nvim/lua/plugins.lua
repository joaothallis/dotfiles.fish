return require('packer').startup(function()
    use 'wbthomason/packer.nvim'

    use 'shaeinst/roshnivim-cs'

    use {'tyru/open-browser-github.vim', requires = {{'tyru/open-browser.vim'}}}

    use {'janko/vim-test', requires = {{'benmills/vimux'}}}

    use "sbdchd/neoformat"

    use {'neovim/nvim-lspconfig', 'williamboman/nvim-lsp-installer'}

    use {
        'junegunn/fzf.vim',
        requires = {'junegunn/fzf', run = './install --bin'}
    }

    use "Olical/vim-enmasse"

    use {'tpope/vim-fugitive'}
    use {'rhysd/committia.vim'}
    use {'lewis6991/gitsigns.nvim'}

    use {
        'numToStr/Comment.nvim',
        config = function() require('Comment').setup() end
    }

    use {'bogado/file-line'}

    use {'elixir-editors/vim-elixir'}
    use {'joaothallis/vim-elixir-alternative-files'}

    use {'github/copilot.vim'}

    use {'joaothallis/vim-websearch', branch = 'feat/query-suffix'}
end)

