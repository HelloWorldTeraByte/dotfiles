set nocompatible
set encoding=utf-8
filetype on
filetype plugin on
filetype indent on
syntax on
set number
set cursorline
set visualbell

set shiftwidth=4
set tabstop=4
set softtabstop=4
set expandtab

set nobackup

set scrolloff=10
set nowrap

set incsearch
set ignorecase
set smartcase
set showcmd
set showmode
set showmatch
set hlsearch

set history=1000

set wildmenu
set wildmode=list:longest

call plug#begin('~/.vim/plugged')
Plug 'dracula/vim'
Plug 'itchyny/lightline.vim'
call plug#end()

colorscheme dracula

let mapleader = " "
inoremap jk <Esc>

let g:lightline = {
            \ 'colorscheme': 'dracula',
            \ }
