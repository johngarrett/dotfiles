-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  -- colorscheme
  use { "ellisonleao/gruvbox.nvim" }
  -- LSP
  use 'neovim/nvim-lspconfig'
  -- completion
  -- use { 'ms-jpq/coq_nvim', branch = 'coq' }
  use { 'ms-jpq/coq_nvim' } --", commit = '5eddd31bf8a98d1b893b0101047d0bb31ed20c49'} -- https://github.com/ms-jpq/coq_nvim/issues/531
  use { 'ms-jpq/coq.artifacts', branch = 'artifacts'}
  -- java LSP
  use 'mfussenegger/nvim-jdtls'
  use 'lervag/vimtex'
  
  -- treesitter for syntax highlighting
  use {
    'nvim-treesitter/nvim-treesitter',
    run = function()
        local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
        ts_update()
    end,
  }

  -- neotree for file browsing
  use {
  "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    requires = { 
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
    }
  }

  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.2',
    requires = { {'nvim-lua/plenary.nvim'} },
    run = function()
	local builtin = require('telescope.builtin')

	--vim.keymap.set('n', '<C-space>', builtin.find_files, {})
	vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
	vim.keymap.set('n', '<leader>j', builtin.find_files, {})
	--vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
	--vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
	--vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
    end,
  }
end)
