" ██╗   ██╗██╗███╗   ███╗                                  
" ██║   ██║██║████╗ ████║                                  
" ██║   ██║██║██╔████╔██║                                  
" ╚██╗ ██╔╝██║██║╚██╔╝██║                                  
"  ╚████╔╝ ██║██║ ╚═╝ ██║                                  
"   ╚═══╝  ╚═╝╚═╝     ╚═╝                                  
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
" http://dvh.io
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
"Plugin 'tpope/vim-fugitive'
Plugin 'gdetrez/vim-gf'         " GF syntax higlighting
"Plugin 'scrooloose/nerdtree'
Plugin 'sjl/gundo.vim'          " FIXME not working, python problem?
Plugin 'terryma/vim-multiple-cursors'
Plugin 'klen/python-mode'

" ---------------------------------
"       Unite plugins
" ---------------------------------
Plugin 'Shougo/unite.vim'
Plugin 'Shougo/vimproc.vim'
Plugin 'Shougo/unite-outline'
Plugin 'Shougo/unite-help'
Plugin 'tsukkee/unite-tag'
Plugin 'Shougo/neocomplete.vim'

" ---------------------------------
"       Visual plugins
" ---------------------------------
Plugin 'mhinz/vim-startify'                 " Useful vim slash screen with sessions
Plugin 'bling/vim-airline'                  " Pretty status line TODO configure me
Plugin 'altercation/vim-colors-solarized'   " Handsome vim
Plugin 'airblade/vim-gitgutter'             " Show git diff marks in gutter
Plugin 'terryma/vim-smooth-scroll'          " Smoothish scrolling!
Plugin 'ConradIrwin/vim-bracketed-paste'    " Make pasting from OS work properly

call vundle#end()
filetype plugin indent on

" =================================
"           MAIN
" =================================

set guifont=Source\ Code\ Pro:h11
syntax enable
set laststatus=2
set background=dark
colorscheme solarized

set backspace=indent,eol,start  " Allow backspace in all circumstances
set history=10000                " Allow undo, remember last command with up
set undolevels=5000             " Use many levels of undo
set wildignore=*.swp,*.bak,*.pyc,*.class

set mouse=a                     " Allow selection with the mouse in all mode
set timeout timeoutlen=225 ttimeoutlen=150

set nobackup
set noswapfile

set ruler                       " Text in status bar shows cursor location
set number                      " Line numbers on left-hand side
set showcmd                     " Update status line when selecting text

set tabstop=4                   " Number of spaces a tab represents
set shiftwidth=4                " Number of spaces shifted with >> command
set expandtab                   " Use spaces rather than hard tab characters
set softtabstop=4               " Tab spaces in no hard tab mode
set autoindent                  " Indent correctly
set shiftround                  " round indent to multiple of 'shiftwidth'

" SEARCHING ===========================================================
set ignorecase                  " Ignore case in searches
set smartcase                   " If uppercase is present, make searches case-sensitive

set incsearch                   " As you type in search pattern, highlight it
set hlsearch                    " Highlight search results
set showmatch                   " Breifly jump to matching bracket when inserting one

set hidden                      " Let user hide text buffer if unsaved
set encoding=utf-8              " Default UTF-8 text encoding, you want this
set fileencoding=utf-8          " unless you're using Notepad

" VISUAL STUFF ========================================================
set colorcolumn=79              " Highlight column 79
set cursorline  cursorcolumn    " Horizontal and vertical cursor line: crosshairs + :)
set scrolloff=2                 " When cursor is 2 lines from bottom, scroll
set relativenumber              " Set line numbers to be relative to the current line
set noshowmode                  " Airline takes care of showing the current mode
set cpoptions+=$                " Add a $ at the end of what you're changing with c
set wildmenu                    " Add a tabbed helper menu
set wildmode=full               " Complete first full match, next match, etc.
set nrformats=                  " Make Ctrl-a and Ctrl-x treat all numbers as decimal,
                                " even with padded 0s.
set listchars=eol:¬,tab:▸·,trail:·,nbsp:~

" =================================
"           MAPPINGS
" =================================

" LEADER
" Might as well use it since it's on my keyboard :)
let mapleader = "ñ"

" Exit to normal mode
inoremap jj <Esc>
inoremap jk <Esc>
inoremap kj <Esc>

" Open vertical split window and move to it
nnoremap <leader>w <C-w>v<C-w>l

" Open newlines above or below without entering insert mode.
nnoremap OO m'O<ESC><C-o>
nnoremap oo m'o<ESC><C-o>

" Map Ctrl-movement to change windows
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Move lines visually
nnoremap k gk
nnoremap j gj

" Use space-space to toggle folds
nnoremap  <Space><Space> za

" Q quits the window
nnoremap Q :q<CR>

" +/-: Increment number on the line
nnoremap + <c-a>
nnoremap - <c-x>

" Return to issue an ex command
nnoremap <CR> :
" Make sure it doesn't interfere with quickfix windows
"autocmd CmdwinEnter * nnoremap <CR> <CR>
"autocmd BufReadPost quickfix nnoremap <CR> <CR>

" Clear search hilight
nnoremap <leader>n :nohl<CR>

"List hidden chars
nnoremap <leader>h :set list!<CR>

" =================================
"       AUTOCMD
" =================================

" Automatically source vimrc on save
autocmd BufWritePost ~/.vimrc so ~/.vimrc

" Call ctags automatically on write
autocmd BufWritePost * call system("ctags -R --fields=+iaSnm --exclude=build
            \ --exclude=.svn --exclude=.git --exclude=log --exclude=tmp .")

" Don't auto-insert a comment leader on the following line
autocmd BufNewFile,BufRead * setlocal formatoptions-=cro

" =================================
"       PLUGIN CONFIG
" =================================

" ---------------------------------
"           Airline
" ---------------------------------

let g:airline_powerline_fonts = 1
" TODO config me please?

" ---------------------------------
"           Unite
" ---------------------------------

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
map [unite]b :Unite -no-split -buffer-name=buffers -quick-match buffer<CR>
map [unite]y :Unite -no-split -buffer-name=yanks history/yank<CR>
" NeoCompleteIncludeMakeCache included as per https://github.com/Shougo/unite.vim/issues/373
map [unite]t :NeoCompleteIncludeMakeCache<CR>:Unite -no-split -buffer-name=tags-include tag/include<CR>
map [unite]o :Unite -no-split -auto-preview -buffer-name=outline outline<CR>
map [unite]h :Unite -no-split -auto-preview -buffer-name=unite-help help<CR>
" Ag in current file (better than grep:%)
map [unite]gf :Unite -no-split -auto-preview -buffer-name=grep-file -start-insert line<CR>
" Ag in current dir
map [unite]gd :Unite -no-split -auto-preview -buffer-name=grep-dir -start-insert grep:.<CR>
" Ag in all buffers
map [unite]gb :Unite -no-split -auto-preview -buffer-name=grep-buffers grep:$buffers<CR>
" Ag for todos
map [unite]gt :Unite -no-split -auto-preview -buffer-name=grep-todos grep:.:-s:\(TODO\|FIXME\)<CR>

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

" ----------------------------------
"        Neocomplete
" ----------------------------------

inoremap <expr><Tab>  neocomplete#start_manual_complete()
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1

" ----------------------------------
"           Pymode
" ----------------------------------

let g:pymode = 1
let g:pymode_trim_whitespaces = 1
let g:pymode_options = 1
let g:pymode_quickfix_minheight = 3
let g:pymode_quickfix_maxheight = 6
let g:pymode_folding = 1
let g:pymode_virtualenv = 1
let g:pymode_run = 1
let g:pymode_run_bind = '<leader>r'

" ----------------------------------
"           Smooth Scroll
" ----------------------------------

noremap <silent> <c-u> :call smooth_scroll#up(&scroll, 0, 2)<CR>
noremap <silent> <c-d> :call smooth_scroll#down(&scroll, 0, 2)<CR>
