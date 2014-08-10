set nocompatible              " Don't be compatible with Vi
filetype off                  " Required to install Vundle

" Set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'tpope/vim-fugitive'
"Plugin 'L9'
Plugin 'kien/ctrlp.vim'
Plugin 'altercation/vim-colors-solarized'
Plugin 'gdetrez/vim-gf'         " GF syntax higlighting
Plugin 'bling/vim-airline'
Plugin 'scrooloose/nerdtree'
Plugin 'rizzatti/dash.vim'
Plugin 'sjl/gundo.vim'

call vundle#end() 
filetype plugin indent on
" Brief help
" :PluginList          - list configured plugins
" :PluginInstall(!)    - install (update) plugins
" :PluginSearch(!) foo - search (or refresh cache first) for foo
" :PluginClean(!)      - confirm (or auto-approve) removal of unused plugins

" *********************************
"           MAIN
" *********************************
 
set guifont=Source\ Code\ Pro:h11
let g:airline_powerline_fonts = 1
syntax enable
set laststatus=2
set background=dark
colorscheme solarized

"set spell                       " Turn on spell checking
set backspace=indent,eol,start  " Allow backspace in all circumstances
set history=2000        " Allow undo, remember last command with up
set undolevels=1000     " Use many levels of undo
set wildignore=*.swp,*.bak,*.pyc,*.class
set mouse=a             " Allow selection with the mouse in all mode
set nobackup
set noswapfile

set ruler               " Text in status bar shows cursor location
set number              " Line numbers on left-hand side
set showcmd             " Update status line when selecting text

set tabstop=4           " Number of spaces a tab represents
set shiftwidth=4        " Number of spaces shifted with a shift >>
set expandtab           " Use spaces rather than hard tab characters
set softtabstop=4       " Tab spaces in no hard tab mode
set autoindent          " Indent correctly
set shiftround          " round indent to multiple of 'shiftwidth'

" SEARCHING ===========================================================
set ignorecase          " Ignore case in searches
set smartcase           " If uppercase is present, make searches case
                        " sensitive
set incsearch           " As you type in search pattern, highlight it
set hlsearch            " Highlight search results
set showmatch           " Breifly jump to matching bracket when inserting one
" =====================================================================

set hidden              " Let user hide text buffer if unsaved
set encoding=utf-8      " Default UTF-8 text encoding, you want this
set fileencoding=utf-8  " unless you're using Notepad

" VISUAL STUFF ========================================================
set colorcolumn=72,79   " Highlight this column
set cursorline          " Add a horizontal cursos line
set scrolloff=2         " When cursor is 5 lines from bottom, scroll
set relativenumber      " Set line numbers to be relative to the current line
" =====================================================================

set cpoptions+=$        " Add a $ at the end of what you're changing with c

set wildmenu            " Add a tabbed helper menu
set wildmode=full       " Complete first full match, next match, etc.  

set nrformats=          " Make Ctrl-a and Ctrl-x treat all numbers as decimal,
                        " even with padded 0s.

" LEADER
let mapleader = ","

" Exit to normal mode
inoremap jj <Esc>

" Open vertical split window and move to it
nnoremap <leader>w <C-w>v<C-w>l

" Map Ctrl-movement to change windows
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Use space to toggle folds
nnoremap <Space> za

" Return to issue an ex command
nnoremap <CR> :
