local nnoremap = require('utils').nnoremap

require('packer').startup(function(use)
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true },
        config = function() require('lualine').setup() end,
        after = 'github-nvim-theme',
    }
    use {
        'projekt0n/github-nvim-theme',
         config = function() require('github-theme').setup() end,
    }
    use {
        'nvim-telescope/telescope.nvim',
        requires = { 'nvim-lua/plenary.nvim' },
        config = require('pluginconfig.telescope').setup,
    }
    use {
        'nvim-treesitter/nvim-treesitter',
        config = require('pluginconfig.nvim-treesitter').setup,
    }
    use 'neovim/nvim-lspconfig'
    use {
        'williamboman/nvim-lsp-installer',
    }
    use 'simrat39/rust-tools.nvim'
    use {
        'hrsh7th/nvim-cmp',
        config = require('pluginconfig.nvim-cmp').setup,
    }
    use 'hrsh7th/cmp-nvim-lsp'
    use 'saadparwaiz1/cmp_luasnip'
    use 'L3MON4D3/LuaSnip' -- Snippets plugin
    use 'powerman/vim-plugin-ruscmd'
    use {
        'kyazdani42/nvim-tree.lua',
        requires = { 'kyazdani42/nvim-web-devicons' },
        config = require('pluginconfig.nvim-tree').setup,
        after = 'github-nvim-theme',
    }
    use 'airblade/vim-gitgutter'
    use {
        'jose-elias-alvarez/null-ls.nvim',
        requires='nvim-lua/plenary.nvim',
    }
end)

-- Neovim options configuration
require('options')
require('lsp').setup()

-- Window navigation
nnoremap('<C-J>', '<C-W><C-J>')
nnoremap('<C-K>', '<C-W><C-K>')
nnoremap('<C-L>', '<C-W><C-L>')
nnoremap('<C-H>', '<C-W><C-H>')
nnoremap('<C-Down>', '<C-W><C-J>')
nnoremap('<C-Up>', '<C-W><C-K>')
nnoremap('<C-Right>', '<C-W><C-L>')
nnoremap('<C-Left>', '<C-W><C-H>')

