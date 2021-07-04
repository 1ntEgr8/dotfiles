" Plugins
call plug#begin('~/.vim/plugged')
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()

" coc vim
let g:coc_start_at_startup = v:false " disable at startup

" colors
" set background=dark
" set termguicolors
" colorscheme base16-classic-dark

" Makefile
noremap M :!make <cr>

" general
syntax off
set nocompatible
set incsearch
set hlsearch
set visualbell
set encoding=utf-8
set autoindent
let mapleader = ','

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
set grepprg=rg

" filetype plugin
filetype plugin on

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
