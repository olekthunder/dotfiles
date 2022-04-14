local M = {}

function M.setup()
    require'nvim-treesitter.configs'.setup {
    ensure_installed = {"rust", "python", "go", "lua"}, -- one of "all", "maintained" (parsers with maintainers), or a list of languages
      highlight = {
        enable = true,              -- false will disable the whole extension
      },
    }
end

return M
