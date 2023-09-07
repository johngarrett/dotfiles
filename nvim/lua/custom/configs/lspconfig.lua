local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"
local servers = { "clangd", "lua_ls" }

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end

-- Disable virtual_text since it's redundant due to lsp_lines.
vim.diagnostic.config({
  virtual_text = false,
})

-- Show line diagnostics automatically in hover window
vim.o.updatetime = 250

--vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
--  vim.lsp.diagnostic.on_publish_diagnostics, {
--    -- Enable underline, use default values
--    underline = true,
--    -- Enable virtual text, override spacing to 4
--    virtual_text = {
--      spacing = 4,
--      prefix = '~',
--    },
--    -- Use a function to dynamically turn signs off
--    -- and on, using buffer local variables
--    signs = function(bufnr, client_id)
--      local ok, result = pcall(vim.api.nvim_buf_get_var, bufnr, 'show_signs')
--      -- No buffer local variable set, so just enable by default
--      if not ok then
--        return true
--      end
--
--      return result
--    end,
--    -- Disable a feature
--    update_in_insert = false,
--  }
--)

-- vim.cmd [[autocmd CursorHold * lua vim.diagnostic.open_float(nil, {focus=false})]]
--vim.cmd [[autocmd CursorHold * lua vim.lsp.util.open_floating_preview({}, {focus=false})]]

local signs = { Error = "", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end
