---@type ChadrcConfig 
local M = {}

 M.ui = {
  theme_toggle = { 'bearded-arc', 'bearded-arc' },
  theme = 'bearded-arc',
  transparency = false
}

M.plugins = "custom.plugins"
M.mappings = require "custom.mappings"

return M
