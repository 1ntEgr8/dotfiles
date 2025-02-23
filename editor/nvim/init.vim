" general
set background=light
syntax off
set nocompatible
set incsearch
set hlsearch
set visualbell
set encoding=utf-8
set autoindent
set signcolumn=yes
let mapleader = ','
let maplocalleader = mapleader

" whitespace
set tabstop=4
set softtabstop=4
set expandtab
set shiftwidth=2
set backspace=indent,eol,start

" formatting
set wrap
set linebreak
set textwidth=0
set wrapmargin=0

" search with ripgrep
set grepprg=rg\ --vimgrep
set grepformat^=%f:%l:%c:%m

" filetype plugin
filetype plugin on

" create the tmp and undo dirs
silent !mkdir -p $HOME/tmp/undo > /dev/null 2>&1

" save swap files to temp dir
set backupdir=$HOME/tmp
set directory=$HOME/tmp

" undo history
set undofile
set undodir=$HOME/tmp/undo

" switch to previous buffer
map <leader><leader> :b#<CR>

" mouse scrolling
set mouse=a

" edit colors
hi DiffAdd      ctermbg=darkgreen   ctermfg=black
hi DiffChange   ctermbg=yellow      ctermfg=black
hi DiffDelete   ctermbg=red         ctermfg=black
hi DiffText     ctermbg=white       ctermfg=black
hi NormalFloat  ctermbg=darkgray    ctermfg=white
hi SignColumn   ctermbg=black       ctermfg=white

" quickfix, location list bindings
noremap [c :cprev<CR>
noremap ]c :cnext<CR>
noremap [v :lnext<CR>
noremap ]v :lprev<CR>

" load lua setup
lua require("config")
