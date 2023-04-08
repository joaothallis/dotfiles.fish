return require('packer').startup(function()
    use 'wbthomason/packer.nvim'

    use 'joaothallis/space-nvim'

    use {'tyru/open-browser-github.vim', requires = {{'tyru/open-browser.vim'}}}

    use({
        "iamcco/markdown-preview.nvim",
        run = function() vim.fn["mkdp#util#install"]() end
    })

    use {'janko/vim-test', requires = {{'benmills/vimux'}}}

    use "sbdchd/neoformat"

    use {
        'VonHeikemen/lsp-zero.nvim',
        requires = {
            {'neovim/nvim-lspconfig'}, {'williamboman/mason.nvim'},
            {'williamboman/mason-lspconfig.nvim'}, {'hrsh7th/nvim-cmp'},
            {'hrsh7th/cmp-buffer'}, {'hrsh7th/cmp-path'},
            {'saadparwaiz1/cmp_luasnip'}, {'hrsh7th/cmp-nvim-lsp'},
            {'hrsh7th/cmp-nvim-lua'}, {'L3MON4D3/LuaSnip'},
            {'rafamadriz/friendly-snippets'}
        }
    }
    use {"ray-x/lsp_signature.nvim"}
    use 'j-hui/fidget.nvim'

    use {
        'junegunn/fzf.vim',
        requires = {'junegunn/fzf', run = './install --bin'}
    }

    use {
        'nvim-telescope/telescope.nvim',
        requires = {{'nvim-lua/plenary.nvim'}}
    }

    use {"Olical/vim-enmasse"}

    use "airblade/vim-rooter"

    use {'tpope/vim-fugitive'}
    use {'rhysd/committia.vim'}
    use {'lewis6991/gitsigns.nvim'}

    use {
        'numToStr/Comment.nvim',
        config = function() require('Comment').setup() end
    }

    use {'bogado/file-line'}

    use {
        'nvim-treesitter/nvim-treesitter-refactor',
        requires = {{'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}}
    }

    use {'elixir-editors/vim-elixir'}
    use {'joaothallis/vim-elixir-alternative-files'}

    use {"zbirenbaum/copilot-cmp", requires = {{"joaothallis/copilot.lua"}}}
end)
