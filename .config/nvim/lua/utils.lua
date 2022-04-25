local M = {}

function M.map(mode, lhs, rhs)
    vim.keymap.set(mode, lhs, rhs, { noremap = true })
end

function M.nnoremap(lhs, rhs) M.map('n', lhs, rhs) end

return M
