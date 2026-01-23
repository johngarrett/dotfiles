local on_attach = require("plugins.configs.lspconfig").on_attach
local on_init = require("plugins.configs.lspconfig").on_init
local capabilities = require("plugins.configs.lspconfig").capabilities

local servers = { "clangd", "lua_ls" }
for _, lsp in ipairs(servers) do
  local settings = {}

  -- recognize vim as a global for the lua LSP
  if lsp == "lua_ls" then
    settings = {
      Lua = {
        diagnostics = {
          globals = { "vim" }
        },
        workspace = {
          library = vim.api.nvim_get_runtime_file("", true),
          checkThirdParty = false,
        },
      }
    }
  end

  vim.lsp.config(lsp, {
    on_init = on_init,
    on_attach = on_attach,
    capabilities = capabilities,
    settings = settings,
  })

  vim.lsp.enable(lsp)
end

-- Show line diagnostics automatically in hover window
vim.o.updatetime = 250

-- Enable signature help popup while typing
--vim.api.nvim_create_autocmd("LspAttach", {
--  callback = function(args)
--    vim.api.nvim_create_autocmd("CursorHoldI", {
--      buffer = args.buf,
--      callback = function()
--        vim.lsp.buf.signature_help()
--      end,
--    })
--  end,
--})



vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    -- Enable underline, use default values
    underline = true,
    -- Enable virtual text, override spacing to 4
    virtual_text = {
      spacing = 4,
      prefix = '~',
    },
    -- Use a function to dynamically turn signs off
    -- and on, using buffer local variables
    signs = function(bufnr, client_id)
      local ok, result = pcall(vim.api.nvim_buf_get_var, bufnr, 'show_signs')
      -- No buffer local variable set, so just enable by default
      if not ok then
        return true
      end

      return result
    end,
    -- Disable a feature
    update_in_insert = false,
  }
)

-- vim.cmd [[autocmd CursorHold * lua vim.diagnostic.open_float(nil, {focus=false})]]
--vim.cmd [[autocmd CursorHold * lua vim.lsp.util.open_floating_preview({}, {focus=false})]]

-- Configure diagnostic signs using the modern API
vim.diagnostic.config({
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = "",
      [vim.diagnostic.severity.WARN] = "",
      [vim.diagnostic.severity.HINT] = "",
      [vim.diagnostic.severity.INFO] = "",
    }
  }
})
