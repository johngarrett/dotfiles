
local plugins = {
  {
    -- disable telescope for fzf (its much better)
    "nvim-telescope/telescope.nvim",
    enabled = false
  },
  {
    -- disable auto pairs, it's causing conflicts on ]d
    "windwp/nvim-autopairs",
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
    'vijaymarupudi/nvim-fzf-commands',
    dependencies = { 'vijaymarupudi/nvim-fzf' },
    lazy = false,
    --config = function()
    --  require "custom.config.fzf"
    --end
  },
  {
    -- need the :Rg functionality
    'junegunn/fzf.vim',
    dependencies = {
      "junegunn/fzf",
      lazy = false,
      build = ":call fzf#install()"
    },
    lazy = false
  },
  -- align columns of text!
  {
    "godlygeek/tabular",
    lazy = false
  },
  {
    "pmizio/typescript-tools.nvim",
    dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
    lazy = false,
    config = function()
      require "custom.configs.ts-tools"
    end,
  },
  {
    "francoiscabrol/ranger.vim",
    lazy = false,
    dependencies = {"rbgrouleff/bclose.vim"},
  },
  {
    "ggvgc/vim-fuzzysearch",
    lazy = false
  },
  { "chrisgrieser/nvim-spider", lazy = true },
  {
    "alepez/vim-gtest",
    lazy = false,
    config = function()
      require "custom.configs.vim_gtest"
    end,
  },
 -- {
 --   'glacambre/firenvim',
 --   lazy = not vim.g.started_by_firenvim,
 --   build = function()
 --       vim.fn["firenvim#install"](0)
 --   end
 --}

  -- multiline LSP errors
  -- SOOOO fucking annoying
  --{
  --  "ErichDonGubler/lsp_lines.nvim",
  --  lazy = false,
  --  dependencies = { "neovim/nvim-lspconfig" },
  --  config = function()
  --    require("lsp_lines").setup()
  --  end,
  --},
  {
    "lewis6991/gitsigns.nvim",
    lazy = false,
    config = function()
      require "custom.configs.gitsigns"
    end,
  },
  -- DIDNT WORK
  --{
  --  "dmmulroy/tsc.nvim",
  --  lazy = false,
  --  config = function()
  --    require "custom.configs.tsc"
  --  end,

  --},
  {
    'akinsho/git-conflict.nvim',
    lazy = false,
    config = function()
      require('git-conflict').setup()
    end
  }
}

return plugins
