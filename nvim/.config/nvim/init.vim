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
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
call plug#end()

set background=dark
colorscheme dracula

let mapleader = " "
inoremap jk <Esc>

let g:lightline = {
            \ 'colorscheme': 'dracula',
            \ 'active': {
            \   'left': [ [ 'mode', 'paste' ],
            \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
            \ },
            \ 'component_function': {
            \   'gitbranch': 'FugitiveHead'
            \ },
            \ }

nmap <leader>gs :G<CR>
nmap <leader>gb :G blame<CR>
nmap <leader>gd :G diff<CR>
nmap <leader>gl :G log<CR>
