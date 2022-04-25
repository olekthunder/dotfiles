local M = {}

function M.setup()
    local map = require("utils").map
    local telescope_builtin = require("telescope.builtin")
    map("n", "<leader>ff", telescope_builtin.find_files)
    map("n", "<leader>fg", telescope_builtin.live_grep)
    map("n", "<leader>fb", telescope_builtin.buffers)
    map("n", "<leader>fh", telescope_builtin.help_tags)
    require('telescope').setup {}
end

return M
