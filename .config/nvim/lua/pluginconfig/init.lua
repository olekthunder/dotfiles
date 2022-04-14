local load_config = function(mod) require('pluginconfig.' .. mod) end

load_config('nvim-lsp-installer')
-- load_config('lspsaga')
load_config('nvim-lspconfig')
load_config('nvim-treesitter')

