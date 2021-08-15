local math_utils = require("utils.math_utils")

local M = {}

M.foo = 'bar'

M.lighten_rgb_piece = function(p, f)
    return 255 - math_utils.round((255 - p) * (1 - f))
end

M.lighten_hex_color = function(c, f)
    colors = {}
    for i=2,6,2 do
        local lightened = M.lighten_rgb_piece(
            tonumber(string.sub(c, i, i+1), 16),
            f
        )
        table.insert(colors, string.format("%x", lightened)
        )
    end

    return "#" .. table.concat(colors, "")
end

return M
