" Plugins

call plug#begin('~/.vim/plugged')
    " theme
    Plug 'chriskempson/base16-vim'

    " sidebar
    Plug 'preservim/nerdtree'

    " syntax 
    Plug 'elmcast/elm-vim'
    Plug 'pangloss/vim-javascript'
    Plug 'rust-lang/rust.vim'
    Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

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
    Plug 'junegunn/goyo.vim'
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

" Goyo
" quit upon :q
function! s:goyo_enter()
  " https://github.com/junegunn/goyo.vim/wiki/Customization#ensure-q-to-quit-even-when-goyo-is-active
  let b:quitting = 0
  let b:quitting_bang = 0
  autocmd QuitPre <buffer> let b:quitting = 1
  cabbrev <buffer> q! let b:quitting_bang = 1 <bar> q!
endfunction

function! s:goyo_leave()
  " Quit Vim if this is the only remaining buffer
  if b:quitting && len(filter(range(1, bufnr('$')), 'buflisted(v:val)')) == 1
    if b:quitting_bang
      qa!
    else
      qa
    endif
  endif
endfunction

autocmd! User GoyoEnter call <SID>goyo_enter()
autocmd! User GoyoLeave call <SID>goyo_leave()

" colors!
set background=dark
set termguicolors

colorscheme base16-material-darker

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
set wrap
set tabstop=4
set softtabstop=4
set expandtab
set shiftwidth=4
set backspace=indent,eol,start

" https://github.com/jonhoo/configs/blob/master/editor/.config/nvim/init.vim
" Wrapping options
set formatoptions=tc " wrap text and comments using textwidth
set formatoptions+=r " continue comments when pressing ENTER in I mode
set formatoptions+=q " enable formatting of comments with gq
set formatoptions+=n " detect lists for formatting
set formatoptions+=b " auto-wrap in insert mode, and do not wrap old long lines
set formatoptions+=w

