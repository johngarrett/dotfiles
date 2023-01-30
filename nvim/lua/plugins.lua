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
  -- latex TODO
  -- use 'lervag/vimtex'
  -- use 'neovim/nvim-lspconfig' -- Configurations for Nvim LSP
end)
