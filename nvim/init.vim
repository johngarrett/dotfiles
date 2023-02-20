let g:coq_settings = { 'auto_start': 'shut-up' } " must be before require('coq')

lua require('plugins')
lua require('lsp')
lua require('treesitter')

set mouse=a

" hybrid: show the current line number and all other lines as relative
set number 
set relativenumber

set expandtab
set tabstop=4
set shiftwidth=4

set background=dark
colorscheme gruvbox


let g:coq_settings = { 'display.icons.mode': 'none' }
let g:coq_settings = { 'keymap.manual_complete': '' } " allow for C-Space :Files map

map <C-Space> :Files<cr> 

" install vim plugged:
" curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
call plug#begin()
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'sheerun/vim-polyglot'
call plug#end()

