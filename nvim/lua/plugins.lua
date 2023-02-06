-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  -- colorscheme
  use { "ellisonleao/gruvbox.nvim" }
  -- neovim for firefox
  use {
    'glacambre/firenvim',
    run = function() vim.fn['firenvim#install'](0) end 
  }
  -- LSP
  use 'neovim/nvim-lspconfig'
  -- completion
  use { 'ms-jpq/coq_nvim', branch = 'coq' }
  use { 'ms-jpq/coq.artifacts', branch = 'artifacts'}
  -- java LSP
  use 'mfussenegger/nvim-jdtls'
  -- latex TODO
  -- use 'lervag/vimtex'
  
  -- treesitter for syntax highlighting
  use {
    'nvim-treesitter/nvim-treesitter',
    run = function()
        local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
        ts_update()
    end,
  }
end)
