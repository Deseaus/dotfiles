" ██╗   ██╗██╗███╗   ███╗                                  
" ██║   ██║██║████╗ ████║                                  
" ██║   ██║██║██╔████╔██║                                  
" ╚██╗ ██╔╝██║██║╚██╔╝██║                                  
"  ╚████╔╝ ██║██║ ╚═╝ ██║                                  
"    ╚═══╝  ╚═╝╚═╝     ╚═╝                                  
"                                                             
" ██████╗ ██╗   ██╗                                        
" ██╔══██╗╚██╗ ██╔╝                                        
" ██████╔╝ ╚████╔╝                                         
" ██╔══██╗  ╚██╔╝                                          
" ██████╔╝   ██║                                           
" ╚═════╝    ╚═╝                                           
"                                                          
" ██████╗ ███████╗███████╗███████╗ █████╗ ██╗   ██╗███████╗
" ██╔══██╗██╔════╝██╔════╝██╔════╝██╔══██╗██║   ██║██╔════╝
" ██║  ██║█████╗  ███████╗█████╗  ███████║██║   ██║███████╗
" ██║  ██║██╔══╝  ╚════██║██╔══╝  ██╔══██║██║   ██║╚════██║
" ██████╔╝███████╗███████║███████╗██║  ██║╚██████╔╝███████║
" ╚═════╝ ╚══════╝╚══════╝╚══════╝╚═╝  ╚═╝ ╚═════╝ ╚══════╝
"
" Daniel Vidal Hussey
" dvh.io
" http://github.io/Deseaus/dotfiles
                                                           
set nocompatible              " Don't be compatible with Vi
filetype off                  " Required to install Vundle

" =================================
"           PLUGINS
" =================================

" Set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" ---------------------------------
"       Utility plugins
" ---------------------------------
Plugin 'gmarik/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'gdetrez/vim-gf'         " GF syntax higlighting
Plugin 'scrooloose/nerdtree'
Plugin 'sjl/gundo.vim'
Plugin 'terryma/vim-multiple-cursors'

" ---------------------------------
"       Unite plugins
" ---------------------------------
Plugin 'Shougo/unite.vim'
Plugin 'Shougo/vimproc.vim'
Plugin 'Shougo/unite-outline'
"Plugin 'Shougo/unite-help'

" ---------------------------------
"       Visual plugins
" ---------------------------------
Plugin 'mhinz/vim-startify'
Plugin 'bling/vim-airline'
Plugin 'altercation/vim-colors-solarized'
Plugin 'airblade/vim-gitgutter'

call vundle#end() 
filetype plugin indent on

" =================================
"           MAIN
" =================================
 
set guifont=Source\ Code\ Pro:h11
let g:airline_powerline_fonts = 1
syntax enable
set laststatus=2
set background=dark
colorscheme solarized

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
set colorcolumn=79      " Highlight column 79
set cursorline          " Add a horizontal cursor line
set cursorcolumn        " Add a vertical cursor line
set scrolloff=2         " When cursor is 2 lines from bottom, scroll
set relativenumber      " Set line numbers to be relative to the current line
set noshowmode          " Airline takes care of showing the current mode
set cpoptions+=$        " Add a $ at the end of what you're changing with c
set wildmenu            " Add a tabbed helper menu
set wildmode=full       " Complete first full match, next match, etc.  
set nrformats=          " Make Ctrl-a and Ctrl-x treat all numbers as decimal,
                        " even with padded 0s.

" =================================
"           MAPPINGS
" =================================

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

" Move lines visually
nnoremap k gk
nnoremap j gj

" Use ctrl-space to toggle folds
" FIXME Not working after adding Unite
" nnoremap <C-Space> za
" nnoremap <C-@> <C-Space>

" Q quits the window
nnoremap Q :q<CR>

" +/-: Increment number
nnoremap + <c-a>
nnoremap - <c-x>

" Return to issue an ex command
nnoremap <CR> :
" Make sure it doesn't interfere with quickfix windows
"autocmd CmdwinEnter * nnoremap <CR> <CR>
" autocmd BufReadPost quickfix nnoremap <CR> <CR>

" Clear search hilight
nnoremap <leader>n :nohl<cr>

" =================================
"       AUTOCMD 
" =================================

" Automatically source vimrc on save
autocmd BufWritePost ~/.vimrc so ~/.vimrc

" =================================
"       PLUGIN CONFIG
" =================================

" ---------------------------------
"           Unite
" ---------------------------------
call unite#custom#profile('default', 'context', {
    \   'winheight': 25,
    \   'direction': 'topleft',
    \ })

call unite#filters#matcher_default#use(['matcher_fuzzy'])
call unite#filters#sorter_default#use(['sorter_rank'])

let g:unite_source_history_yank_enable = 1
let g:unite_force_overwrite_statusline = 0
let g:unite_source_grep_max_candidates = 200
if executable('ag')
    let g:unite_source_grep_command = 'ag'
    let g:unite_source_grep_default_opts = '-i --line-numbers --nocolor --nogroup --hidden'
    let g:unite_source_grep_recursive_opt = ''
    let g:unite_source_rec_async_command = 'ag --follow --nocolor --nogroup --hidden -g ""'
endif

nnoremap [unite] <Nop>
nmap <space> [unite]

map [unite]f :Unite -no-split -buffer-name=files -start-insert file_rec/async<CR>
map [unite]b :Unite -no-split -buffer-name=buffers buffer<CR>
map [unite]y :Unite -no-split -buffer-name=yanks history/yank<CR>
map [unite]o :Unite -no-split -buffer-name=outline -auto-preview outline<CR>
map [unite]h :Unite -no-split -auto-preview -buffer-name=unite-help help<cr>
" Ag in current file (better than grep:%)
map [unite]gf :Unite -no-split -auto-preview -buffer-name=grep-file -start-insert line<CR>
" Ag in current dir
map [unite]gd :Unite -no-split -auto-preview -buffer-name=grep-dir -start-insert grep:.<CR>
" Ag in all buffers
map [unite]gb :Unite -no-split -auto-preview -buffer-name=grep-buffers -start-insert grep:$buffers<CR>
" Ag for todos
map [unite]gt :Unite -no-split -auto-preview -buffer-name=grep-todos -start-insert grep:.:-s:\(TODO\|FIXME\)<cr>

" ----------------------------------
"        Startify              
" ----------------------------------
let g:startify_session_dir = '~/.vim/sessions'
let g:startify_list_order = [  
        \ ['   Sessions:'],    
        \ 'sessions',
        \ ['   Bookmarks:'],
        \ 'bookmarks',
        \ ['   Recents:'],
        \ 'files',
        \ ]
let g:startify_bookmarks = [
            \ '~/dotfiles/vimrc',
            \ '~/dotfiles/zshrc',
            \ '~/dotfiles/general.zsh',
            \ '~/dotfiles/aliases.zsh',
            \ '~/dotfiles/functions.zsh',
            \ '~/dotfiles/shortcuts.zsh',
            \]
let g:startify_files_number = 8
let g:startify_session_autoload = 1         " Load session if in bookmarked dir
let g:startify_session_persistence = 1      " Auto-update sessions
let g:startify_restore_position = 1         " Go to where the cursor last was
let g:startify_change_to_dir = 1            " Change to dir of opened file
let g:startify_custom_header = [
            \ '                     ██╗   ██╗██╗███╗   ███╗ ',
            \ '                     ██║   ██║██║████╗ ████║ ',
            \ '                     ██║   ██║██║██╔████╔██║ ',
            \ '                     ╚██╗ ██╔╝██║██║╚██╔╝██║ ',
            \ '                      ╚████╔╝ ██║██║ ╚═╝ ██║ ',
            \ '                       ╚═══╝  ╚═╝╚═╝     ╚═╝ ',
            \ '',
            \ '',
            \]

" ----------------------------------
"        Gitgutter              
" ----------------------------------

"  Don't set mappings
let g:gitgutter_map_keys = 0
