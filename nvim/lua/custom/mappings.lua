local M = {}

M.fzf = {
  n = {
    ["<leader>fw"] = {':Rg <CR>'},
    ["<leader>ff"] = {':Files <CR>'},
    ["<leader>fg"] = {':GFiles <CR>'},
    ["<leader>fb"] = {':Buf <CR>'},
    ["<leader>fa"] = {':Marks <CR>'},
    ["<leader>wf"] = {':Rg <C-R><C-W><CR>'},
  }
}
M.ranger = {
  n = {
    ['<leader>fr'] = {':Ranger <CR>'}
  }
}

M.ts_tools = {
  n = {
    ["gd"] = {
      function()
        vim.lsp.buf.definition()
      end,
      "Goto prev diag"
    },
    ["K"] = {
      function()
        vim.lsp.buf.hover()
      end,
      "Goto prev diag"
    },
    ["<leader>ca"] = {
      function()
        vim.lsp.buf.code_action()
      end,
      "Goto prev diag"
    },
    ["gr"] = {
      function()
        vim.lsp.buf.references()
      end,
      "Goto prev diag"
    },
    ["gi"] = {
      function()
        vim.lsp.buf.implementation()
      end,
      "Goto prev diag"
    },
    ["<leader>q"] = {
      function()
        vim.diagnostic.setloclist()
      end,
      "Goto prev diag"
    },
    ["<leader>ra"] = {
      function()
        require("nvchad.renamer").open()
      end,
      "Goto prev diag"
    },
    ["[d"] = {
      function()
        vim.diagnostic.goto_prev { float = { border = "rounded" } }
      end,
      "Goto prev diag"
    },
    ["]d"] = {
      function()
        vim.diagnostic.goto_next { float = { border = "rounded" } }
      end,
      "Goto next diag"
    },
  }
}

return M
