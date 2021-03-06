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

" =================================
"           PLUGINS
" =================================

" Automatically install Vim plug if it isn't installed
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

" ---------------------------------
"       Utility Plugins
" ---------------------------------
Plug 'Deseaus/vim-gf', {'for' : 'gf'}
Plug 'terryma/vim-multiple-cursors'
Plug 'python-mode/python-mode', {'for': 'py'}
Plug 'LaTeX-Box-Team/LaTeX-Box', {'for': ['tex', 'bib']}
Plug 'mbbill/undotree'
Plug 'pdurbin/vim-tsv', {'for': 'tsv'}
Plug 'rust-lang/rust.vim'
Plug 'chrisbra/csv.vim', {'for': 'csv'}
Plug 'ludovicchabant/vim-gutentags'

" ---------------------------------
"       Unite Plugins
" ---------------------------------
Plug 'Shougo/unite.vim'
Plug 'Shougo/vimproc.vim', {'do': 'make'}
Plug 'Shougo/unite-outline'
Plug 'Shougo/unite-help'
Plug 'tsukkee/unite-tag'
Plug 'Shougo/vimfiler.vim'
Plug 'Shougo/neocomplete.vim'

" ---------------------------------
"       Visual Plugins
" ---------------------------------
Plug 'mhinz/vim-startify'               " Useful vim splash screen with sessions
Plug 'vim-airline/vim-airline'          " Pretty status line
Plug 'vim-airline/vim-airline-themes'   " Airline themes
Plug 'altercation/vim-colors-solarized' " Handsome vim
Plug 'airblade/vim-gitgutter'           " Show git diff marks in gutter
"Plug 'ConradIrwin/vim-bracketed-paste' " Make pasting from OS work properly
Plug 'junegunn/goyo.vim'                " Easier writing
Plug 'elzr/vim-json'                    " Pretty JSON
"Plug 'mitsuhiko/vim-python-combined'    " Better python syntax
Plug 'christoomey/vim-tmux-navigator'   " Painless vim-tmux navigation

call plug#end()

" =================================
"           MAIN
" =================================
set shell=/bin/sh

set guifont=Source\ Code\ Pro:h11
syntax enable
set laststatus=2
set background=dark
colorscheme solarized

set backspace=indent,eol,start  " Allow backspace in all circumstances
set history=10000                " Allow undo, remember last command with up
set wildignore+=*.swp,*.bak,*.pyc,*.class,*.aux,*.gfo,*.dll,*.o,*.jpg,*.jpeg,*.png,*.gif,*$py.class,*.class,*/*.dSYM/*,*.dylib

" Keep undo history across sessions by storing it in a file
if has('persistent_undo')
     let undodir = expand(vimDir . '/undo')
     silent call system('mkdir -p ' . &undodir)
     set undofile
     set undolevels=5000             " Use many levels of undo
     set undoreload=5000
 endif


set mouse=a                     " Allow selection with the mouse in all mode
set timeout timeoutlen=225 ttimeoutlen=150

set nobackup
set noswapfile

"set clipboard=unnamedplus       " Yank to clipboard

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
set linebreak                   " Don't break in the middle of a word.
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
let mapleader = ","

" Exit to normal mode
inoremap jj <Esc>
inoremap jk <Esc>
inoremap kj <Esc>

" Open vertical split window and move to it
nnoremap <leader>w <C-w>v<C-w>l
" Open horiztonal split window and move to it
nnoremap <leader>e <C-w>s<C-w>l

" Open newlines above or below without entering insert mode.
nnoremap OO m'O<ESC><C-o>
nnoremap oo m'o<ESC><C-o>

" Map Ctrl-movement to change windows
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Move lines visually
" http://stackoverflow.com/questions/20975928/moving-the-cursor-through-long-soft-wrapped-lines-in-vim/21000307#21000307
noremap <silent> <expr> j (v:count == 0 ? 'gj' : 'j')
noremap <silent> <expr> k (v:count == 0 ? 'gk' : 'k')

" Use space-space to toggle folds
nnoremap  <Space><Space> za

" Q quits the window, will complain if there are unsaved changes
nnoremap Q :q<CR>

" +/-: Increment number on the line
nnoremap + <c-a>
nnoremap - <c-x>

" Return to issue an ex command
nnoremap <CR> :
vnoremap <CR> :
" Make sure it doesn't interfere with quickfix windows
"autocmd CmdwinEnter * nnoremap <CR> <CR>
"autocmd BufReadPost quickfix nnoremap <CR> <CR>

" Clear search hilight
nnoremap <leader>n :nohl<CR>

"List hidden chars
nnoremap <leader>h :set list!<CR>

" Insert ipdb breakpoint
nnoremap <leader>d oimport ipdb; ipdb.set_trace()<Esc>k

" Make Y consistent with C, D.
nnoremap Y y$

" Make K split lines (pair with J to join lines)
noremap K i<cr><esc>k$

" =================================
"       AUTOCMD
" =================================

" Automatically source vimrc on save
autocmd BufWritePost ~/.vimrc so ~/.vimrc

" Don't auto-insert a comment leader on the following line
autocmd BufNewFile,BufRead * setlocal formatoptions-=cro

" Auto-resize splits http://stackoverflow.com/questions/2519582/preserving-equal-sized-split-view
autocmd VimResized * wincmd =

" =================================
"       PLUGIN CONFIG
" =================================

" ---------------------------------
"           Netrw (Built-in)
" ---------------------------------

" Default to NERDTree like behaviour.
let g:netrw_liststyle=3

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
" Pretty: https://github.com/Shougo/unite.vim/issues/531
call unite#custom#source( 'buffer', 'converters', ['converter_file_directory'])

let g:unite_source_history_yank_enable = 1
let g:unite_force_overwrite_statusline = 0
let g:unite_source_grep_max_candidates = 200
if executable('ag')
    let g:unite_source_grep_command = 'ag'
    let g:unite_source_grep_default_opts =
                \ '-i --vimgrep --ignore ' .
                \ '''.hg'' --ignore ''.svn'' --ignore ''.git'' --ignore ''.bzr'''
    let g:unite_source_grep_recursive_opt = ''
    "let g:unite_source_rec_async_command = 'ag --follow --nocolor --nogroup --hidden -g ""'
    let g:unite_source_rec_async_command =
                \ ['ag', '--follow', '--nocolor', '--nogroup',
                \  '--hidden', '-g', '']
endif

nnoremap [unite] <Nop>
nmap <space> [unite]

map [unite]f :Unite -no-split -buffer-name=files -start-insert file_rec/async<CR>
map [unite]n :Unite -no-split -buffer-name=files -start-insert file_rec/git<CR>
map [unite]b :Unite -no-split -buffer-name=buffers -quick-match buffer<CR>
map [unite]y :Unite -no-split -buffer-name=yanks history/yank<CR>
" NeoCompleteIncludeMakeCache included as per https://github.com/Shougo/unite.vim/issues/373
"map [unite]t :NeoCompleteIncludeMakeCache<CR>:Unite -no-split -buffer-name=tags-include tag/include<CR>
map [unite]t :Unite -no-split -buffer-name=tags-include tag/include<CR>
"map [unite]o :Unite -no-split -auto-preview -buffer-name=outline outline<CR>
map [unite]o :Unite -no-split -buffer-name=outline-all outline<CR>
map [unite]h :Unite -no-split -auto-preview -buffer-name=unite-help help<CR>
" Ag in current file (better than grep:%)
map [unite]gf :Unite -no-split -auto-preview -buffer-name=grep-file -start-insert line<CR>
" Ag in current dir
map [unite]gd :Unite -no-split -auto-preview -buffer-name=grep-dir -start-insert grep:.<CR>
" Ag in all buffers
map [unite]gb :Unite -no-split -auto-preview -buffer-name=grep-buffers grep:$buffers<CR>
" Ag for todos
" TODO not working, configuration must have changed
map [unite]gt :Unite -no-split -auto-preview -buffer-name=grep-todos grep:.:-s:\(TODO\|FIXME\)<CR>
map [unite]d :VimFiler<CR>

" ----------------------------------
"        VimFiler
" ----------------------------------

let g:vimfiler_as_default_explorer = 1
let g:vimfiler_ignore_pattern = [
            \ '^\.',
            \ '^\.git$',
            \ '^\lib$',
            \ '^\.DS_Store$',
            \ '^\*.pyc'
            \ ]

" ----------------------------------
"        Startify
" ----------------------------------

hi StartifyBracket ctermfg=244
hi StartifyFile    ctermfg=136
hi StartifyFooter  ctermfg=244
hi StartifyHeader  ctermfg=33
hi StartifyNumber  ctermfg=166
hi StartifyPath    ctermfg=244
hi StartifySlash   ctermfg=245
hi StartifySpecial ctermfg=244

let g:startify_session_dir = '~/.vim/sessions'
let g:startify_list_order = [
        \ ['   Sessions:'],
        \ 'sessions',
        \ ['   Bookmarks:'],
        \ 'bookmarks',
        \ ['   Recents:'],
        \ 'files',
        \ ['   Current directory:'],
        \ 'dir',
        \ ]
let g:startify_custom_indices = ['f', 'g', 'h']
let g:startify_bookmarks = [
            \ '~/dotfiles/vimrc',
            \ '~/dotfiles/zshrc',
            \ '~/dotfiles/tmux.conf',
            \ '~/dotfiles/general.zsh',
            \ '~/dotfiles/aliases.zsh',
            \ '~/dotfiles/functions.zsh',
            \ '~/dotfiles/shortcuts.zsh',
            \ '~/.ssh/config',
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
let g:startify_custom_footer = [
            \ '',
            \ '',
            \ '     e   New empty buffer.                   ',
            \ '     i   New empty buffer in insert mode.    ',
            \ '     b   Open in the same buffer.            ',
            \ '     s   Open in split.                      ',
            \ '     v   Open in vertical split.             ',
            \ '     t   Open in tab.                        ',
            \ '',
            \ '',
            \]

" ----------------------------------
"        Gitgutter
" ----------------------------------

"  Don't set mappings
let g:gitgutter_map_keys = 0

" ----------------------------------
"           Pymode
" ----------------------------------

let g:pymode = 1
let g:pymode_python = 'python'
" Rope
let g:pymode_rope = 1
"let g:pymode_rope_show_doc_bind = 'S'
let g:pymode_rope_goto_definition_bind = ''
let g:pymode_rope_complete_on_dot = 0

" Documentation
let g:pymode_doc = 0
"let g:pymode_doc_bind = 'S'

" Linting
let g:pymode_lint = 1
let g:pymode_lint_checker = ['pyflakes', 'pep8', 'mccabe', 'pylint', 'pep257']
" Auto check on save
let g:pymode_lint_write = 1
let g:pymode_lint_message = 1
let g:pymode_lint_cwindow = 1
let g:pymode_lint_sort = ['E', 'C', 'I']

" Syntax
let g:pymode_syntax_print_as_function = 1

let g:pymode_trim_whitespaces = 1
let g:pymode_folding = 0
let g:pymode_options = 1
let g:pymode_quickfix_minheight = 3
let g:pymode_quickfix_maxheight = 6
let g:pymode_virtualenv = 1
let g:pymode_run = 1
let g:pymode_motion = 1
let g:pymode_run_bind = '<leader>rr' "TODO Fix, onlt r conflicts with Goyo

" ----------------------------------
"           Goyo
" ----------------------------------

nnoremap <Leader>r :Goyo<CR>

" ----------------------------------
"           Undotree
" ----------------------------------

nnoremap <Leader>u :UndotreeToggle<CR>
let g:undotree_SetFocusWhenToggle = 1
let g:undotree_WindowLayout = 1
let g:undotree_SplitWidth = 40
let g:undotree_DiffpanelHeight = 8

" ----------------------------------
"           LaTeX-Box
" ----------------------------------

let g:LatexBox_no_mappings = 0
let g:LatexBox_latexmk_preview_continuously = 1
let g:LatexBox_quickfix = 2
let g:LatexBox_Folding = 0
let g:LatexBox_custom_indent = 0
let g:LatexBox_split_width = 45

" ----------------------------------
"        Neocomplete
" ----------------------------------

" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
let g:neocomplete#sources#syntax#min_keyword_length = 3

highlight Pmenu ctermbg=8 guibg=#606060
highlight PmenuSel ctermbg=1 guifg=#dddd00 guibg=#1f82cd
highlight PmenuSbar ctermbg=0 guibg=#d6d6d6

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
"autocmd FileType python setlocal omnifunc=pythoncomplete#Complete

" ----------------------------------
"        VimFiler
" ----------------------------------

let g:vimfiler_ignore_pattern = ['*pyc']
