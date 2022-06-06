"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""               
"               
"               ██╗   ██╗██╗███╗   ███╗██████╗  ██████╗
"               ██║   ██║██║████╗ ████║██╔══██╗██╔════╝
"               ██║   ██║██║██╔████╔██║██████╔╝██║     
"               ╚██╗ ██╔╝██║██║╚██╔╝██║██╔══██╗██║     
"                ╚████╔╝ ██║██║ ╚═╝ ██║██║  ██║╚██████╗
"                 ╚═══╝  ╚═╝╚═╝     ╚═╝╚═╝  ╚═╝ ╚═════╝
"               
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Disable compatibility with vi which can cause unexpected issues.
set nocompatible

" Enable mouse in Normal and Visual mode
set mouse=nv

" Encoding
set encoding=UTF-8

" Enable type file detection. Vim will be able to try to detect the type of file in use.
filetype on

" Enable plugins and load plugin for the detected file type.
filetype plugin on

" Load an indent file for the detected file type.
"filetype indent on

" Indent
set softtabstop=4 " every time you press the <Tab> key the cursor moves to the next 4-column boundary
set shiftwidth=4  " amount of spaces you want for a deeper level
set autoindent    " turns it on
set smartindent   " does the right thing (mostly) in programs
set cindent       " stricter rules for C programs
"set expandtab     " don't use actual tab character (ctrl-v)
 
" Turn syntax highlighting on.
syntax on

" Add numbers to each line on the left-hand side.
set number
set relativenumber

" Highlight cursor line underneath the cursor horizontally.
set cursorline

" Highlight cursor line underneath the cursor vertically.
"set cursorcolumn

" Ignore capital letters during search.
set ignorecase

" Override the ignorecase option if searching for capital letters.
" This will allow you to search specifically for capital letters.
set smartcase

" Show match as search proceeds
set incsearch

" Search highlighting
set hlsearch

" Show partial command you type in the last line of the screen.
set showcmd

" Show the mode you are on the last line.
set noshowmode

let g:airline_powerline_fonts = 1
"let g:airline_left_sep=''
"let g:airline_right_sep=''


call plug#begin()
" The default plugin directory will be as follows:
"   - Vim (Linux/macOS): '~/.vim/plugged'
"   - Vim (Windows): '~/vimfiles/plugged'
"   - Neovim (Linux/macOS/Windows): stdpath('data') . '/plugged'
" You can specify a custom plugin directory by passing it as the argument
"   - e.g. `call plug#begin('~/.vim/plugged')`
"   - Avoid using standard Vim directory names like 'plugin'

" Make sure you use single quotes
Plug 'vim-airline/vim-airline'
Plug 'mhinz/vim-startify'
Plug 'tyrannicaltoucan/vim-quantum'
Plug 'ap/vim-css-color'
Plug 'tpope/vim-fugitive'
Plug 'preservim/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'ryanoasis/vim-devicons' "Always load the vim-devicons as the very last one.
call plug#end()


" Vim-ariline theme
let g:airline_theme='quantum'

" Colorscheme Quantum :A color scheme based on Google's Material Design palette.
set background=dark
set termguicolors
let g:quantum_italics=1
let g:quantum_black=1
colorscheme quantum


" Remove pipes | that act as separators on splits
set fillchars+=vert:\ 
" White space at the end
