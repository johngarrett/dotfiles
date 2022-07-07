set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath=&runtimepath
source ~/.vimrc

lua require('nvim-cmp')
lua require('barbar-config')
lua require('lsp-config')
lua require('treesitter')
