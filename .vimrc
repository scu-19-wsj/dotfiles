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
set encoding=utf-8

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


" ==================== vim-airline ====================
let g:airline_powerline_fonts = 1 
"let g:airline_left_sep=''
"let g:airline_right_sep=''

" Vim-ariline theme
"let g:airline_theme='quantum'


" ==================== Automatically install Vim-Plug ========================
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif


" ==================== Install Plugins with Vim-Plug ====================
call plug#begin()
" The default plugin directory will be as follows:
"   - Vim (Linux/macOS): '~/.vim/plugged'
"   - Vim (Windows): '~/vimfiles/plugged'
"   - Neovim (Linux/macOS/Windows): stdpath('data') . '/plugged'
" You can specify a custom plugin directory by passing it as the argument
"   - e.g. `call plug#begin('~/.vim/plugged')`
"   - Avoid using standard Vim directory names like 'plugin'

" Make sure you use single quotes
Plug 'neoclide/coc.nvim', { 'branch':  'release' }
Plug 'vim-airline/vim-airline'
Plug 'mhinz/vim-startify'
Plug 'twerth/ir_black'
Plug 'tyrannicaltoucan/vim-quantum'
Plug 'ap/vim-css-color'
Plug 'tpope/vim-fugitive'
Plug 'preservim/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'ryanoasis/vim-devicons' "Always load the vim-devicons as the very last one.
call plug#end()


" ===================== Theme =====================
" Colorscheme Quantum :A color scheme based on Google's Material Design palette.
"set termguicolors
"set background=dark
"let g:quantum_italics=1
"let g:quantum_black=1
"colorscheme quantum

" Colorscheme ir_black
"set termguicolors
colorscheme ir_black

" Remove pipes | that act as separators on splits
set fillchars+=vert:\ 
" White space at the end


" ==================== coc.nvim ====================
let g:coc_global_extensions = ['coc-clangd']

" TextEdit might fail if hidden is not set.
set hidden

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=1000

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=number

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ CheckBackspace() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-@> coc#refresh()

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"


" ================= Key Mapping =================  
" exit insert mode
inoremap jk <esc>

