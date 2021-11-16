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

" lsp
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'quangnguyen30192/cmp-nvim-ultisnips'
Plug 'hrsh7th/nvim-cmp'

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
" Plug 'glepnir/lspsaga.nvim'

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'preservim/nerdcommenter'
Plug 'tpope/vim-surround'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
"Plug 'luochen1990/rainbow'
call plug#end()

set background=dark
colorscheme dracula

let mapleader = " "
inoremap jk <Esc>

" nvim-cmp
lua require('config.nvim-cmp')

" lsp
lua require('lsp.cpp')
lua require('config.nvim-lsp')

lua require('config.nvim-treesitter')

" lua require('config.lspsaga')

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

" rainbow 
let g:rainbow_active = 1

" git gutter
set updatetime=1000
nmap <leader>ghn <Plug>(GitGutterNextHunk)
nmap <leader>ghp <Plug>(GitGutterPrevHunk)

" fugitive
nmap <leader>gs :G<CR>
nmap <leader>gb :G blame<CR>
nmap <leader>gd :G diff<CR>
nmap <leader>gl :G log<CR>

" FZF
nnoremap <silent> <leader>ff :Files<CR>
nnoremap <silent> <leader>bb :Buffers<CR>
nnoremap <silent> <C-f> :Rg<CR>

" netrw file explorer
nnoremap <silent> <leader>ft :Vexplore<CR>
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_winsize = 20

" splits
set splitbelow splitright
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

noremap <silent> <C-Left> :vertical resize +3<CR>
noremap <silent> <C-Right> :vertical resize -3<CR>
noremap <silent> <C-Up> :resize +3<CR>
noremap <silent> <C-Down> :resize -3<CR>

" buffers
nnoremap <silent> <leader>bn :bn<CR>
nnoremap <silent> <leader>bp :bp<CR>
nnoremap <silent> <leader>bt <C-^><CR>
nnoremap <silent> <leader>bd :bd<CR>

" utilsnips
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:UltiSnipsEditSplit="vertical"
