set mouse=a
set sidescroll=1

syntax on
set number
set ruler

set hlsearch

set smarttab
set expandtab
set tabstop=4
set shiftwidth=4

autocmd Filetype f90 setlocal tabstop=-2

" sideways scrolling
noremap <C-ScrollWheelLeft> 1zh
noremap <C-ScrollWheelRight> 1zl

" tab navigaiton
nnoremap th  :tabfirst<CR>
nnoremap tk  :tabnext<CR>
nnoremap tj  :tabprev<CR>
nnoremap tl  :tablast<CR>

" persistent undo
try
    set undodir=~/.vim_runtime/temp_dirs/undodir
    set undofile
catch
endtry

" Bash like keys for the command line
cnoremap <C-A>		<Home>
cnoremap <C-E>		<End>
cnoremap <C-K>		<C-U>

" space = search
map <space> /

" plugs
call plug#begin('~/.vim/plugged')

Plug 'valloric/youcompleteme'
Plug 'itchyny/lightline.vim'
Plug 'kaicataldo/material.vim'
Plug 'https://github.com/keith/swift.vim.git'
Plug 'https://github.com/vim-syntastic/syntastic.git'

call plug#end()

" colors
if (has('nvim'))
  let $NVIM_TUI_ENABLE_TRUE_COLOR = 1
endif

if (has('termguicolors'))
  set termguicolors
endif

" theme
let g:material_theme_style = 'darker'
set laststatus=2
colorscheme material

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

" swiftlint searches for the .yml file in the current directory, not root
" todo: write an autocmd script
" let g:syntastic_swift_swiftlint_use_defaults = 1 
" swiftlint searches for the .yml file in the current directory, not root
let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes': [],'passive_filetypes': [] }
let g:ycm_autoclose_preview_window_after_completion = 1
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" enable swift lint
let g:syntastic_swift_checkers = ['swiftlint']
