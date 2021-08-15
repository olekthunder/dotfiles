local awful = require("awful")

local M = {}

M.placement_centered = (awful.placement.centered + awful.placement.no_offscreen)

return M