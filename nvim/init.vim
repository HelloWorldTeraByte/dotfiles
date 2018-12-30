set encoding=utf-8
set nocompatible
filetype off

call plug#begin('~/.config/nvim/plugged')
Plug 'vim-syntastic/syntastic'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'zchee/deoplete-clang'
Plug 'Shougo/neoinclude.vim'
Plug 'flazz/vim-colorschemes'
Plug 'scrooloose/nerdtree'
Plug 'itchyny/lightline.vim'
Plug 'scrooloose/nerdcommenter'
call plug#end()

syntax on

let mapleader = "\\"
map <space> \

set autoread

set showmatch               " Show matching brackets.
set tabstop=4               " number of columns occupied by a tab character
set softtabstop=4           " see multiple spaces as tabstops so <BS> does the right thing
set expandtab               " converts tabs to white space
set shiftwidth=4            " width for autoindents
set autoindent              " indent a new line the same amount as the line just typed
set number                  " add line numbers
set t_Co=256
set termguicolors

"syntastic configs
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_c_config_file = '.flags'

"deoplete
let g:deoplete#enable_at_startup = 1
autocmd CompleteDone * silent! pclose!
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><S-TAB>  pumvisible() ? "\<C-p>" : "\<S-TAB>"

set background=dark
colorscheme gruvbox

set noshowmode
let g:lightline = { 'colorscheme': 'seoul256' }

set guifont=Fira\ Code\ Light\ 9
set guioptions-=m  "remove menu bar
set guioptions-=T  "remove toolbar
set guioptions-=r  "remove right-hand scroll bar
set guioptions-=L  "remove left-hand scroll bar

"Cause we hardcore
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>
inoremap <Up> <NOP>
inoremap <Down> <NOP>
inoremap <Left> <NOP>
inoremap <Right> <NOP>

nnoremap <C-Right> :vertical resize +5<CR>
nnoremap <C-Left> :vertical resize -5<CR>
nnoremap <C-Up> :resize -5<CR>
nnoremap <C-Down> :resize +5<CR>
nnoremap <C-c> :nohl<CR>

map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

nmap <leader>w :w<cr>
nmap <leader>q :q<cr>

" Close the current buffer
map <leader>bc :bd<cr>

" Close all the buffers
map <leader>ba :bufdo bd<cr>

map <leader>l :bnext<cr>
map <leader>h :bprevious<cr>

" Useful mappings for managing tabs
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove 
map <leader>t<leader> :tabnext 

map <leader>n :NERDTreeToggle<CR>

imap jk <Esc>
map <leader>ss :setlocal spell!<cr>

" copy and paste
vmap <C-c> "+y
vmap <C-x> "+c
imap <C-v> <ESC>"+pa

"nmap <C-n> :NERDTreeToggle<CR>

nmap <F5> :w<CR> :make<CR>
nmap <C-F5> :w<CR> :make rebuild<CR>

