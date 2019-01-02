set nocompatible        " Be iMproved
set encoding=utf-8      " Set encoding to be utf-8
filetype plugin indent on

set showmatch           " Show matching brackets.
set autoindent          " Indent according to previous line.
set expandtab           " Use spaces instead of tabs.
set softtabstop=4       " Tab key indents by 4 spaces.
set shiftwidth=4        " >> indents by 4 spaces.
set shiftround          " >> indents to next multiple of 'shiftwidth'.

set backspace=indent,eol,start  " Make backspace work as you would expect.
set showcmd                     " Show already typed keys when more are expected.
set incsearch                   " Highlight while searching with / or ?.
set hlsearch                    " Keep matches highlighted.

call plug#begin('~/.config/nvim/plugged')
Plug 'flazz/vim-colorschemes'
Plug 'scrooloose/nerdtree'
Plug 'itchyny/lightline.vim'
Plug 'kien/ctrlp.vim'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'w0rp/ale'
call plug#end()

set t_Co=256                " Set colors to 256
syntax on                   " Enable syntax highlighting.
set number                  " Set line numbering
colorscheme gruvbox

set laststatus=2
set noshowmode
let g:lightline = {'colorscheme': 'one'}

map <C-n> :NERDTreeToggle<CR>

" Switch around buffers more easily
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Resize Buffers
nnoremap <C-Right> :vertical resize +5<CR>
nnoremap <C-Left> :vertical resize -5<CR>
nnoremap <C-Up> :resize -5<CR>
nnoremap <C-Down> :resize +5<CR>

nnoremap <C-c> :nohl<CR>    " Clear highlighting
