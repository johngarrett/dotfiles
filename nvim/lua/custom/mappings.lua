local M = {}

M.fzf = {
  n = {
    ["<leader>fw"] = {':Rg <CR>'},
    ["<leader>ff"] = {':Files <CR>'},
    ["<leader>fg"] = {':GFiles <CR>'},
    ["<leader>fb"] = {':Buf <CR>'},
    ["<leader>fa"] = {':Marks <CR>'},
    ["<leader>wf"] = {':Rg <C-R><C-W><CR>'},
    ["<leader>fts"] = {
      function()
      vim.fn['fzf#run']({
          source = 'find . -type f -name "*.ts" -not -path "*/dist/*" -not -path "*/node_modules*"',
        --  window = {
        --    width = "0.9",
        --    height = "0.9",
        --  }
         -- left = "10%",
         -- right = "10%",
         -- down = "~60%"
      })
      end,
      'find typescript file'
    },
    ["<leader>fc"] = {
      function()
      vim.fn['fzf#run']({
          source = 'find . -type f -name "*.cpp" -o -name "*.hpp" -not -path "*/build/*" -not -path "*/third_party/*"',
          down = "~60%"
      })
      end,
      'find cpp/hpp file'
    }
  }
}

M.ranger = {
  n = {
    ['<leader>fr'] = {':Ranger <CR>'}
  }
}

M.fuzzy_search = {
  n = {
    ["<leader>fs"] = {':FuzzySearch <CR>'},
  }
}

M.spider = {
  n = {
    [",w"] = { function() require('spider').motion('w') end },
    [",e"] = { function() require('spider').motion('e') end },
    [",b"] = { function() require('spider').motion('b') end },
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
