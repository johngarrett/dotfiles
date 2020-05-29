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
" set timeoutlen=100
let g:vim_markdown_folding_disabled = 1

set encoding=utf-8
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

" directory management
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 2
let g:netrw_altv = 1
let g:netrw_winsize = 25
:com E Vexplore
:com Bo browse oldfiles " ex: vsp #<18

map <space> /

" plugs
call plug#begin('~/.vim/plugged')

Plug 'valloric/youcompleteme'
Plug 'vim-airline/vim-airline'
Plug 'gruvbox-community/gruvbox'
Plug 'segeljakt/vim-stealth'
Plug 'https://github.com/keith/swift.vim.git'
Plug 'https://github.com/vim-syntastic/syntastic.git'
Plug 'plasticboy/vim-markdown'
Plug 'https://github.com/pangloss/vim-javascript.git'
Plug 'iamcco/markdown-preview.vim'
Plug 'edkolev/tmuxline.vim'
Plug 'StanAngeloff/php.vim'
Plug 'alvan/vim-php-manual'
Plug 'rust-lang/rust.vim'
Plug 'tmhedberg/matchit'

call plug#end()

" colors
set t_Co=256

if (has('nvim'))
  let $NVIM_TUI_ENABLE_TRUE_COLOR = 1
endif

if (has('termguicolors'))
  set termguicolors
endif

" theme
set background=dark
set laststatus=2
set termguicolors
colorscheme gruvbox

" airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
let g:airline_powerline_fonts = 1

" syntastic
let g:syntastic_aggregate_errors = 1
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

"" linters
let g:syntastic_php_checkers = ['php', 'phpcs', 'phpmd']
let g:syntastic_php_phpcs_exec = '/usr/local/bin/phpcs'

let g:syntastic_python_checkers = ['pylint']
let g:loaded_syntastic_cpp_cpplint_checker = 1
