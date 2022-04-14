local nnoremap = require('utils').nnoremap


require('packer').startup(function(use)
    use 'projekt0n/github-nvim-theme'
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true },
        config = function() require('lualine').setup() end,
    }
    use { 'nvim-telescope/telescope.nvim', requires = { 'nvim-lua/plenary.nvim' } }
    use 'nvim-treesitter/nvim-treesitter'
    use 'neovim/nvim-lspconfig'
    use 'williamboman/nvim-lsp-installer'
    use 'simrat39/rust-tools.nvim'
    use {
        'kyazdani42/nvim-tree.lua',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true },
        config = function() require'nvim-tree'.setup {} end
    }
end)

require('options')
require('pluginconfig')

-- Colorscheme
vim.cmd('colorscheme github_dark')

-- Window navigation
nnoremap('<C-J>', '<C-W><C-J>')
nnoremap('<C-K>', '<C-W><C-K>')
nnoremap('<C-L>', '<C-W><C-L>')
nnoremap('<C-H>', '<C-W><C-H>')
nnoremap('<C-Down>', '<C-W><C-J>')
nnoremap('<C-Up>', '<C-W><C-K>')
nnoremap('<C-Right>', '<C-W><C-L>')
nnoremap('<C-Left>', '<C-W><C-H>')
