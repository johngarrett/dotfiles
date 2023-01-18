set mouse=a
set sidescroll=1

syntax on
syntax enable
set number
set ruler

set hlsearch
set smartcase " switch to case-sensitive search when uppercase letter is present
set nowrap
set cursorline " highlight current line
set relativenumber 
set title " change window title on file

set smarttab
set expandtab

set tabstop=4
set shiftwidth=4

set encoding=utf-8

" sideways scrolling
noremap <C-ScrollWheelLeft> 1zh
noremap <C-ScrollWheelRight> 1zl

" spell checking
"set spell spelllang=en_us

set splitbelow
set splitright

" persistent undo
try
    set undodir=~/.cache/nvim/undodir
    set undofile
catch
    echoerr 'Unable to set undo directory'
endtry

" directory management
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 2
let g:netrw_altv = 1
let g:netrw_winsize = 25
:com E Explore

:com Bo browse oldfiles " ex: vsp #<18

" plugs
call plug#begin('~/.vim/plugged')

" langugages
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" themes
Plug 'vim-airline/vim-airline' " bottom line of vim
Plug 'edkolev/tmuxline.vim' " tmux theme
Plug 'gruvbox-community/gruvbox' " vim theme

call plug#end()

" colors
set t_Co=256

if (has('nvim'))
  let $NVIM_TUI_ENABLE_TRUE_COLOR = 1
endif

if (has('termguicolors'))
  set termguicolors
endif

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
let g:airline#extensions#tabline#formatter = 'default'
let g:airline_powerline_fonts = 1
let g:airline_section_z = ''
let g:airline_section_y = ''
let g:airline_section_x = ''
let g:airline_section_a = ''

" nvim-comp
set completeopt=menu,menuone,noselect

" markdown
let g:vim_markdown_folding_disabled = 1
"" use vim-pandoc as a standalone
augroup pandoc_syntax
    au! BufNewFile,BufFilePre,BufRead *.md set filetype=markdown.pandoc
augroup END
