local M = {}

M.fzf = {
  n = {
    ["<leader>fw"] = { ':Rg <CR>' },
    ["<leader>ff"] = {
      function()
        require('fzf-commands').files()
      end
    },
    ["<leader>fg"] = {':GFiles <CR>'},
    ["<leader>fb"] = {
      function()
        require('fzf-commands').bufferpicker()
      end
    },
    ["<leader>ft"] = {
      function()
        require('fzf-commands').files({
          command_flags = '--type f -e ts -E "*/dist/*" -E "node_modules*"'
        })
      end,
    },
    ["<leader>fc"] = {
      function()
        require('fzf-commands').files({
          command_flags = '--type f -e cpp -e hpp -e c -e h -E "third_party*" -E "PrivateFrameworks"'
        })
      end,
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
