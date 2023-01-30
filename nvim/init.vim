lua require('plugins')
" lua require('lsp')

set mouse=a

" hybrid: show the current line number and all other lines as relative
set number 
set relativenumber

set expandtab
set tabstop=4
set shiftwidth=4

set background=dark
colorscheme gruvbox


" disable icons in coq_nvim
let g:coq_settings = { 'display.icons.mode': 'none' }
let g:coq_settings = { 'auto_start': 'shut-up' }
" let g:coq_settings = { 'manual_complete': 'null' }

" install vim plugged:
" curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
call plug#begin()
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'sheerun/vim-polyglot'
Plug 'ms-jpq/coq_nvim', {'branch': 'coq'}
call plug#end()

map <C-Space> :Files<cr> 
