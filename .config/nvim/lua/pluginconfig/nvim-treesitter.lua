local M = {}

function M.setup()
    require 'nvim-treesitter.configs'.setup {
        ensure_installed = { "rust", "python", "go", "lua" },
        highlight = {
            enable = true,
        },
    }
end

return M
