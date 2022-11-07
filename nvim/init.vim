lua require('plugins')

set mouse=a

" hybrid: show the current line number and all other lines as relative
set number 
set relativenumber

set expandtab
set tabstop=4
set shiftwidth=4

set background=dark
colorscheme gruvbox

" install vim plugged:
" curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
call plug#begin()
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
call plug#end()
