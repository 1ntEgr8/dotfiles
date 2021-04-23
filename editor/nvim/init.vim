" Plugins
call plug#begin('~/.vim/plugged')
    " theme
    Plug 'chriskempson/base16-vim'

    " sidebar
    " Plug 'preservim/nerdtree'

    " line numbers
    " Plug 'myusuf3/numbers.vim'

    " syntax 
    Plug 'elmcast/elm-vim'
    Plug 'pangloss/vim-javascript'
    Plug 'HerringtonDarkholme/yats.vim'
    Plug 'maxmellon/vim-jsx-pretty'
    Plug 'rust-lang/rust.vim'
    Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
    Plug 'dart-lang/dart-vim-plugin'
    Plug 'dag/vim-fish'
    Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install',
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html'] }
    Plug 'mattn/emmet-vim'
    Plug 'elixir-editors/vim-elixir'
    Plug 'glench/vim-jinja2-syntax'
    Plug 'urbit/hoon.vim'
    
    " fzf
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'

    " general 
    " Plug 'itchyny/lightline.vim'
    Plug 'machakann/vim-highlightedyank'
    Plug 'tpope/vim-surround'

    " autocomplete
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()

" coc vim
let g:coc_start_at_startup = v:false " disable at startup

" fzf
map <C-p> :Files<CR>

" NERDTree
" map <C-s> :NERDTreeToggle<CR>
" map <leader>s :NERDTreeFind<CR>

" colors
" set background=dark
" set termguicolors
" colorscheme base16-classic-dark

" Makefile
noremap M :!make <cr>

" general
syntax off " hehe
set nocompatible
set incsearch
set hlsearch
" set number
set visualbell
set encoding=utf-8
set autoindent
" set noshowmode " lightline handles display of modes
" set laststatus=2 " for lightline
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
