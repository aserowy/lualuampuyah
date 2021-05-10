local vim = vim

-- TODO rework with config functions and requires
require'packer'.startup(function(use)
    use 'wbthomason/packer.nvim'

    -- theme
    use 'norcalli/nvim-base16.lua'

    -- zen
    use 'kdav5758/TrueZen.nvim'

    -- common
    use 'glepnir/dashboard-nvim'
    use 'glepnir/galaxyline.nvim'
    use {'lukas-reineke/indent-blankline.nvim', branch = 'lua'}
    use '907th/vim-auto-save'
    use {'folke/which-key.nvim', config = function() require('which-key').setup {} end}

    -- scrolling
    use 'karb94/neoscroll.nvim'
    use 'nacro90/numb.nvim'
    use 'dstein64/nvim-scrollview'

    -- navigation
    use 'kyazdani42/nvim-tree.lua'
    use {'nvim-telescope/telescope.nvim', requires = 'nvim-lua/popup.nvim'}
    use {'romgrk/barbar.nvim', requires = 'kyazdani42/nvim-web-devicons'}

    -- lsp
    use 'neovim/nvim-lspconfig'
    use 'kabouzeid/nvim-lspinstall'
    use 'onsails/lspkind-nvim'
    use 'folke/lsp-trouble.nvim'

    -- linting
    use 'norcalli/nvim-colorizer.lua'

    use 'nvim-treesitter/nvim-treesitter'
    use 'p00f/nvim-ts-rainbow'
    use 'romgrk/nvim-treesitter-context'
    use 'nvim-treesitter/nvim-treesitter-textobjects'

    -- motion
    use {'phaazon/hop.nvim', as = 'hop', config = function() require'hop'.setup {} end}
    use 'unblevable/quick-scope'

    -- formatting
    use 'b3nj5m1n/kommentary'
    use 'sbdchd/neoformat'

    -- autocompletion
    use 'windwp/nvim-autopairs'
    use 'hrsh7th/nvim-compe'
    use 'kosayoda/nvim-lightbulb'
    use 'hrsh7th/vim-vsnip'

    -- terminal
    use 'numtostr/FTerm.nvim'

    -- TODO git
    -- https://github.com/sindrets/diffview.nvim
    use {'lewis6991/gitsigns.nvim', requires = 'nvim-lua/plenary.nvim'}
end)

-- zen
require'true-zen'

-- common
require'configs.dashboardnvim'
require'configs.galaxylinenvim'
require'configs.gitsignsnvim'
require'configs.indentblanklinenvim'
require'configs.nvimbase16'.init()
require'configs.vimautosave'

-- scrolling
require'configs.neoscrollnvim'
require'numb'.setup()
require'configs.nvimscrollview'

-- navigation
require'configs.nvimtree'
require'configs.telescopenvim'

-- lsp
require'configs.nvimlspconfig'
require'configs.nvimlspinstall'
require'configs.lspkindnvim'
require'configs.lsptroublenvim'

-- linting
require'configs.nvimcolorizer'
require'configs.nvimtreesitter'

-- formatting
require'kommentary.config'

-- autocompletion
require'configs.nvimautopair'
require'configs.nvimcompe'
require'configs.nvimlightbulb'

-- terminal
require'FTerm'.setup()
