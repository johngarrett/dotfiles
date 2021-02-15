set mouse=a
set sidescroll=1

syntax on
syntax enable
set number
set ruler

set hlsearch
set nowrap

set smarttab
set expandtab
set tabstop=4
set shiftwidth=4

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

" splits
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

set splitbelow
set splitright

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
:com E Explore
:com Bo browse oldfiles " ex: vsp #<18

map <space> /

" plugs
call plug#begin('~/.vim/plugged')

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'vim-airline/vim-airline'
Plug 'gruvbox-community/gruvbox'
Plug 'segeljakt/vim-stealth'
Plug 'keith/swift.vim'
Plug 'TheCodedSelf/syntastic-swift'
Plug 'rust-lang/rust.vim'
Plug 'vim-syntastic/syntastic'
Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-pandoc/vim-pandoc-syntax'
Plug 'ap/vim-css-color'
Plug 'vim-php/tagbar-phpctags.vim'
Plug 'majutsushi/tagbar'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'JulesWang/css.vim'
Plug 'edkolev/tmuxline.vim'
Plug 'StanAngeloff/php.vim'
Plug 'alvan/vim-php-manual'
Plug 'rust-lang/rust.vim'
Plug 'tmhedberg/matchit'
Plug 'prabirshrestha/vim-lsp'
call plug#end()

" colors
set t_Co=256

if (has('nvim'))
  let $NVIM_TUI_ENABLE_TRUE_COLOR = 1
endif

if (has('termguicolors'))
  set termguicolors
endif

let g:tagbar_phpctags_bin='PATH_TO_phpctags'

" tmux colors
if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
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
filetype plugin on
filetype plugin indent on
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

let g:syntastic_swift_checkers = ['swiftlint', 'swiftpm']

" SourceKit-LSP configuration
if executable('sourcekit-lsp')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'sourcekit-lsp',
        \ 'cmd': {server_info->['sourcekit-lsp']},
        \ 'whitelist': ['swift'],
        \ })
endif

autocmd FileType swift nnoremap <C-]> :LspDefinition<CR>

" Required for operations modifying multiple buffers like rename.
set hidden
