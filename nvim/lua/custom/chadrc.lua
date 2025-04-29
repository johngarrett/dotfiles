---@type ChadrcConfig 
local M = {}

 M.ui = {
  theme_toggle = { 'chadracula', 'chadracula' },
  theme = 'chadracula',
  transparency = false
}

M.plugins = "custom.plugins"
M.mappings = require "custom.mappings"

return M
