" plugins
call plug#begin('~/.vim/plugged')
    Plug 'neovim/nvim-lspconfig'
call plug#end()

" general
syntax off
set background=light
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

lua << EOF

-- setup lsp servers, but turn off by default
local nvim_lsp = require('lspconfig')

local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  -- Enable completion triggered by <c-x><c-o>
  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = { noremap=true, silent=true }

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', '<leader>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', '<leader>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
  buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap('n', '<leader>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
  buf_set_keymap("n", "<leader>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
end

-- list servers here
local servers = {}
for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup {
    on_attach = on_attach,
    autostart = false,
    flags = {
      debounce_text_changes = 150,
    }
  }
end

local signs = { Error = "E", Warning = "W", Hint = "H", Information = "I" }

for type, icon in pairs(signs) do
  local hl = "LspDiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end
EOF
