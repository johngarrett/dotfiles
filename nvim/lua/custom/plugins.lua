
local plugins = {
  {
    -- disable telescope for fzf (its much better)
    "nvim-telescope/telescope.nvim",
    enabled = false
  },
  {
    "neovim/nvim-lspconfig",
    -- TODO
    --dependencies = {
    --  {
    --    -- format & linting
    --    "jose-elias-alvarez/null-ls.nvim",
    --    config = function()
    --      require "custom.configs.null-ls"
    --    end,
    --  },
    --},

    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end,
  },
  -- allows for relative and regular line numbers, looks ugly tho
  --{
  --  "vim-scripts/RltvNmbr.vim",
  --  lazy = false
  --},
  {
    "vim-scripts/a.vim",
    lazy = false,
    config = function()
      require "custom.configs.avim"
    end
  },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "clangd"
      }
    }
  },
  {
    "mfussenegger/nvim-lint"
  },
  {
    "junegunn/fzf.vim",
    lazy = false,
    dependencies = {
      "junegunn/fzf",
      lazy = false,
      build = ":call fzf#install()",
    },
    config = function()
      require "custom.configs.fzf"
    end,
  },
  -- align columns of text!
  {
    "godlygeek/tabular",
    lazy = false
  },
  {
    "pmizio/typescript-tools.nvim",
    dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
    opts = {},
    lazy = false,
    config = function()
      require "custom.configs.ts-tools"
    end,
  },
  {
    "francoiscabrol/ranger.vim",
    lazy = false,
    dependencies = {"rbgrouleff/bclose.vim"},
    config = function()
      require "custom.configs.ranger"
    end,
  },
  -- multiline LSP errors
  {
    "ErichDonGubler/lsp_lines.nvim",
    lazy = false,
    dependencies = { "neovim/nvim-lspconfig" },
    config = function()
      require("lsp_lines").setup()
    end,
  },
}

return plugins
