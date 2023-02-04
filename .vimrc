"=========================================================================================
"
" Mantainer:  lcontrerasv
"
" Updated:    04/02/2023
"
" Sections:
"   -> General
"   -> User interface
"   -> Colors and Fonts
"   -> Text, tab and indent relate
"   -> Keymap
"   -> Plugins
"       -> Specific Plugin's configuration
"
"=========================================================================================
"
"=========================================================================================
" => General 
"=========================================================================================
" Sets how many lines of history VIM has to remember
set history=700

" Enable filetype plugins
filetype plugin on
filetype indent on

" Set to auto read when a file is changed from the outside
set autoread

" Use UTF-8 without BOM
set encoding=utf-8

" Deactivate compatible mode
if &compatible
  set nocompatible
endif

" Make it so that if files are changed externally (ex: changing git branches) update the vim buffers automatically
autocmd FocusGained,BufEnter,CursorHold,CursorHoldI * if mode() != 'c' | checktime | endif
autocmd FileChangedShellPost *
  \ echohl WarningMsg | echo "File changed on disk. Buffer reloaded." | echohl None

" Make it so any .env files are correctly styled. Normally only worked with .env
autocmd BufNewFile,BufRead * if expand('%t') =~ '.env' | set filetype=sh | endif

" Use the OS clipboard by default (on versions compiled with `+clipboard`)
set clipboard=unnamed

" Optimized for fast terminal connections
set ttyfast

" Don't add empty newlines at the end of files
set binary
set noeol

" Centralize backups, swapfiles and undo history
silent !mkdir ~/.vim/backups > /dev/null 2>&1
set backupdir=~/.vim/backups

silent !mkdir ~/.vim/swaps > /dev/null 2>&1
set directory=~/.vim/swaps

if exists("&undodir")
  silent !mkdir ~/.vim/undo > /dev/null 2>&1
  set undodir=~/.vim/undo
endif

" Don’t create backups when editing files in certain directories
set backupskip=/tmp/*,/private/tmp/*

" Enable per-directory .vimrc files and disable unsafe commands in them
set exrc
set secure

" Disable error bells
set noerrorbells

"=========================================================================================
" => User interface
"=========================================================================================
" Don’t show the intro message when starting Vim
set shortmess=atI

" Enhance command-line completion
set wildmenu

" Enable line numbers
set number

" Enable syntax highlighting
syntax on

" Allow backspace in insert mode
set backspace=indent,eol,start

" Highlight current line
set cursorline

" Always show the status bar and airline
set laststatus=2

" A buffer becomes hidden when it is abandoned (used for refactors)
set hidden

" Show “invisible” characters
set lcs=tab:->,trail:·,eol:¬,nbsp:_
set list

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases
set smartcase

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch

" Enable mouse in all modes
set mouse=a

" Don’t reset cursor to start of line when moving around.
set nostartofline
" Show the cursor position
set ruler

" Show the current mode
set showmode

" Show the filename in the window titlebar
set title

" Show the (partial) command as it’s being typed
set showcmd

" Use relative line numbers
"if exists("&relativenumber")
"  set relativenumber
"  au BufReadPost * set relativenumber
"endif

" Start scrolling three lines before the horizontal window border
set scrolloff=3

" Don't redraw while executing macros (good performance config)
set lazyredraw

" For regular expressions turn magic on
set magic

" I don't like line-wrapping
set nowrap
set lbr
set tw=500

" Show matching brackets when text indicator is over them
set showmatch
" How many tenths of a second to blink when matching brackets
set mat=2

" No annoying sound on errors
set novisualbell

"=========================================================================================
" => Colors and Fonts
"=========================================================================================
" Enable syntax highlighting
syntax enable
set background=dark

if $TERM == "xterm-256color"
  set t_Co=256

  silent! colorscheme desert
  " let it fail quietly if it hasn't been installed yet
  silent! colorscheme solarized
else
  silent! colorscheme desert
  " let it fail quietly if it hasn't been installed yet
  silent! colorscheme solarized
endif

if has("nvim")
  " Update cursor after the changes to nvim
  set guicursor=n-v-c:block-Cursor/lCursor-blinkon0
  set guicursor+=i-ci:block-Cursor/lCursor
  set guicursor+=r-cr:hor20-Cursor/lCursor
else
  set guicursor=
endif

"=========================================================================================
" => Text, tab and indent related
"=========================================================================================
" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
set smarttab

" 1 tab == 2 spaces
set shiftwidth=2
set tabstop=2

" Linebreak on 500 characters
set lbr
set tw=500

" Auto indent
set ai

" Smart indent
set si

"Wrap lines
set nowrap

"=========================================================================================
" => Keymap
"=========================================================================================

let mapleader = ","
let g:mapleader = ","



"=========================================================================================
" => Plugins
"=========================================================================================
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

silent !mkdir ~/.vim/bundle > /dev/null 2>&1

call plug#begin('~/.vim/bundle')

Plug 'https://github.com/pangloss/vim-javascript.git'

Plug 'https://github.com/leafgarland/typescript-vim.git'

Plug 'https://github.com/MaxMEllon/vim-jsx-pretty'

Plug 'prettier/vim-prettier', { 'do': 'yarn install', 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html'] }
let g:prettier#autoformat = 0
autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.yaml,*.html PrettierAsync

Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'scrooloose/nerdcommenter'

Plug 'Xuyuanp/nerdtree-git-plugin', { 'on': 'NERDTreeToggle' }

Plug 'junegunn/fzf.vim'
Plug 'liuchengxu/vista.vim'
Plug 'jeetsukumaran/vim-pythonsense'
Plug 'jiangmiao/auto-pairs'
Plug 'sheerun/vim-polyglot'

Plug 'Vimjas/vim-python-pep8-indent'
Plug 'dense-analysis/ale'

" Use release branch (recommend)
Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()
"=========================================================================================
" => NERDTree
"=========================================================================================

map <leader>N :NERDTreeToggle<cr>
map <leader>F :NERDTreeFind<cr>

