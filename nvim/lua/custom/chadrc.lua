---@type ChadrcConfig 
local M = {}

 M.ui = {
  theme_toggle = { 'ayu_dark', 'gruvbox' },
  theme = 'gruvbox',
  transparency = false
}

M.plugins = "custom.plugins"
M.mappings = require "custom.mappings"

return M
