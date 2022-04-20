local nnoremap = require("utils").nnoremap

nnoremap("<C-b>", ":NvimTreeToggle<CR>")
nnoremap("<C-f>", ":NvimTreeFindFile<CR>")

local M = {}

function M.setup()
   require'nvim-tree'.setup { open_on_setup = true }
end

return M
