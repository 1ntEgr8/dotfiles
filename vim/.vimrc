" Plugins

call plug#begin('~/.vim/plugged')
    " theme
    Plug 'chriskempson/base16-vim'

    " sidebar
    Plug 'preservim/nerdtree'

    " line numbers
    Plug 'myusuf3/numbers.vim'

    " syntax 
    Plug 'elmcast/elm-vim'
    Plug 'pangloss/vim-javascript'
    Plug 'rust-lang/rust.vim'
    Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
    Plug 'dart-lang/dart-vim-plugin'
    Plug 'dag/vim-fish'

    " syntastic
    " Plug 'vim-syntastic/syntastic' 

    " general 
    Plug 'itchyny/lightline.vim'
    Plug 'machakann/vim-highlightedyank'
    Plug 'majutsushi/tagbar'
    Plug 'tpope/vim-surround'
    Plug 'tpope/vim-fugitive'
    Plug 'ctrlpvim/ctrlp.vim'

    " autocomplete
    Plug 'neoclide/coc.nvim', {'branch': 'release'}

    " markdown
    Plug 'plasticboy/vim-markdown'
call plug#end()

" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0

" ctrlp
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

" NERDTree
let mapleader = ','
map <C-s> :NERDTreeToggle<CR>
map <leader>s :NERDTreeFind<CR>

set background=dark
set termguicolors

colorscheme base16-material-darker

" Makefile
noremap M :!make <cr>

" general
syntax on
set nocompatible
set incsearch
set hlsearch
set number
set visualbell
set encoding=utf-8
set autoindent
set noshowmode " lightline handles display of modes
set laststatus=2 " for lightline
let mapleader = ','

" whitespace
set tabstop=4
set softtabstop=4
set expandtab
set shiftwidth=4
set backspace=indent,eol,start

" formatting
set wrap
set linebreak
set textwidth=0
set wrapmargin=0

" quick searches
set grepprg=rg

" save swap files to temp dir
set backupdir=$HOME/tmp
set directory=$HOME/tmp
