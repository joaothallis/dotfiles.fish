return require('packer').startup(function()
    use 'wbthomason/packer.nvim'

    use 'Mofiqul/vscode.nvim'

    use 'shaeinst/roshnivim-cs'

    use {'tyru/open-browser-github.vim', requires = {{'tyru/open-browser.vim'}}}

    use "sbdchd/neoformat"

    use {'neovim/nvim-lspconfig', 'williamboman/nvim-lsp-installer'}

    use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}

    use {
        'junegunn/fzf.vim',
        requires = {'junegunn/fzf', run = './install --bin'}
    }

    use "Olical/vim-enmasse"

    use {'tanvirtin/vgit.nvim', requires = {'nvim-lua/plenary.nvim'}}

    use {
        'numToStr/Comment.nvim',
        config = function() require('Comment').setup() end
    }

    use {'bogado/file-line'}
end)

