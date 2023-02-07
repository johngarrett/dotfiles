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

map <C-Space> :Files<cr> 

" disable icons in coq_nvim
let g:coq_settings = { "display.icons.mode": 'none', "auto_start": 'shut-up', "keymap.manual_complete_insertion_only": v:true }

" install vim plugged:
" curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
call plug#begin()
Plug 'junegunn/fzf.vim'
Plug 'sheerun/vim-polyglot'
Plug 'ms-jpq/coq_nvim', {'branch': 'coq'}
call plug#end()
