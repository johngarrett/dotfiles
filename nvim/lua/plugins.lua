-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim' -- Packer can manage itself
    use 'neovim/nvim-lspconfig' -- Configurations for Nvim LSP
    use 'ellisonleao/gruvbox.nvim' -- theme
end)
