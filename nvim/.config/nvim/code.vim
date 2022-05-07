set nocompatible
set encoding=utf-8
filetype on
filetype plugin on
filetype indent on
syntax enable
set number
set cursorline
set visualbell

set shiftwidth=4
set tabstop=4
set softtabstop=4
set expandtab

set nobackup
set hidden

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

let mapleader = " "

xmap gc  <Plug>VSCodeCommentary
nmap gc  <Plug>VSCodeCommentary
omap gc  <Plug>VSCodeCommentary
nmap gcc <Plug>VSCodeCommentaryLine

nnoremap <silent> <leader>cb :call VSCodeNotify('editor.action.blockComment')<CR>
xnoremap <silent> <leader>cb :call VSCodeNotify('editor.action.blockComment')<CR>

nnoremap <silent> <C-j> :call VSCodeNotify('workbench.action.navigateDown')<CR>
xnoremap <silent> <C-j> :call VSCodeNotify('workbench.action.navigateDown')<CR>
nnoremap <silent> <C-k> :call VSCodeNotify('workbench.action.navigateUp')<CR>
xnoremap <silent> <C-k> :call VSCodeNotify('workbench.action.navigateUp')<CR>
nnoremap <silent> <C-h> :call VSCodeNotify('workbench.action.navigateLeft')<CR>
xnoremap <silent> <C-h> :call VSCodeNotify('workbench.action.navigateLeft')<CR>
nnoremap <silent> <C-l> :call VSCodeNotify('workbench.action.navigateRight')<CR>
xnoremap <silent> <C-l> :call VSCodeNotify('workbench.action.navigateRight')<CR>

nnoremap <silent> gr :call VSCodeNotify('editor.action.rename')<CR>

"nnoremap <silent> <leader>bn :call VSCodeNotify('workbench.action.nextEditor')<CR>
"nnoremap <silent> <leader>bp :call VSCodeNotify('workbench.action.previousEditor')<CR>
nnoremap <silent> <leader>b :call VSCodeNotify('workbench.action.quickOpenPreviousRecentlyUsedEditorInGroup')<CR>

nnoremap <silent> <leader>f :call VSCodeNotify('editor.action.formatDocument')<CR>

nnoremap <silent> <leader>vb :call VSCodeNotify('workbench.action.toggleSidebarVisibility')<CR>
