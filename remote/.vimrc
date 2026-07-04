" =====================
" Remote Vim
" =====================

" Better defaults
set nocompatible
syntax on
filetype plugin indent on

" UI
set number
set relativenumber
set cursorline
set nowrap
set scrolloff=5

" Tabs
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set smartindent

" Search
set ignorecase
set smartcase
set incsearch
set hlsearch

" Misc
set mouse=a
"set clipboard+=unnamedplus
" set undofile
set hidden
set updatetime=250

" Leader
let mapleader=" "

" Quick save/quit
nnoremap <leader>w :w<CR>
nnoremap <leader>q :q<CR>

" Clear search
nnoremap <Esc> :noh<CR><Esc>
