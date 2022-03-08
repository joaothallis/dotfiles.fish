return require('packer').startup(function()
    use 'wbthomason/packer.nvim'

    use 'Mofiqul/vscode.nvim'

    use {
        'tyru/open-browser-github.vim',
        requires = {{'tyru/open-browser.vim'}}
    }

    use "sbdchd/neoformat"

    use "neovim/nvim-lspconfig"

    use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}

    use {
        'nvim-telescope/telescope.nvim',
        requires = {{'nvim-lua/plenary.nvim'}}
    }

    use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make'}

    use "Olical/vim-enmasse"
end)

