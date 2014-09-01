 set nocompatible               " be iMproved
 filetype off                   " required!

 set rtp+=~/.vim/bundle/vundle/
 call vundle#rc()

 " let Vundle manage Vundle
 " required! 
Bundle 'gmarik/vundle'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'scrooloose/syntastic'
Bundle 'kien/ctrlp.vim'
Bundle 'vim-scripts/a.vim'
Bundle 'bling/vim-airline'
Bundle 'tpope/vim-dispatch'
Bundle 'rking/ag.vim'
Bundle 'scrooloose/nerdtree.git'
Bundle 'rizzatti/funcoo.vim'
Bundle 'rizzatti/dash.vim'
Bundle 'tikhomirov/vim-glsl'
Bundle 'kovisoft/slimv'

set tabstop=4
nnoremap <esc> :noh<return><esc>

function! s:QuickMake()
	let format = &errorformat	" capture current local efm
	:wall
	:silent!make
	let &efm=format " transfer error format to quickfix buffer
endfunction

command! -nargs=0 QuickMake :call s:QuickMake()

" nmap <F7> :make<CR>
nmap <F7> :QuickMake<CR>

" Use F8/F9 to jump between errors in the quickfix window
nmap <F8> :cnext<CR>
nmap <F9> :cprev<CR>
map <F10> :clist<CR>
map <F4> :!/Users/daniel/code/rocket/ogl_editor/tundra-output/macosx-clang-debug-default/RocketEditor.app/Contents/MacOS/editor<CR><ESC>
" map <F5> :!open /Users/daniel/code/rocket/ogg_editor/tundra-output/macosx-clang-debug-default/RocketEditor.app<CR><ESC>
" map <F4> :!/Users/danielcollin/code/amiga/tbl-newage/tundra-output/macosxm32-clang-debug-default/HCLitePlayer<CR><ESC>
" map <F5> :!/Users/daniel/code/amiga/tbl-newage/tundra-output/macosx-clang-debug-default/HCLiteConverter<CR><ESC>
set makeprg=tundra2\ macosx-clang-debug\ amiga-vbccosx-debug

set laststatus=2

set guioptions=-t 

syntax enable
" colorscheme dusk 
colorscheme distinguished

au BufNewFile,BufRead *.frag,*.vert,*.fp,*.vp,*.glsl setf glsl

let mapleader = ","
set nowrap        " don't wrap lines
set tabstop=4     " a tab is four spaces
set backspace=indent,eol,start
                  " allow backspacing over everything in insert mode
set autoindent    " always set autoindenting on
set copyindent    " copy the previous indentation on autoindenting
set number        " always show line numbers
set shiftwidth=4  " number of spaces to use for autoindenting
set shiftround    " use multiple of shiftwidth when indenting with '<' and '>'
set showmatch     " set show matching parenthesis
set ignorecase    " ignore case when searching
set smartcase     " ignore case if search pattern is all lowercase,
                  "    case-sensitive otherwise
set smarttab      " insert tabs on the start of a line according to
                  "    shiftwidth, not tabstop
set hlsearch      " highlight search terms
set incsearch     " show search matches as you type

set history=1000         " remember more commands and search history
set undolevels=1000      " use many muchos levels of undo
set wildignore=*/tundra-output/*,*/t2-output/*,*.swp,*.bak,*.pyc,*.class,*.o,*.a,*.tga,*.bin,*.x86,*.
set title                " change the terminal's title
set visualbell           " don't beep
set noerrorbells         " don't beep

set nobackup
set noswapfile

set guifont=ProggySquare:h11
set noanti
set linespace=2

nmap <silent> <leader>d <Plug>DashSearch

autocmd FileType lisp set tabstop=2|set shiftwidth=2|set expandtab
autocmd FileType c set tabstop=4|set shiftwidth=4
autocmd FileType objc set tabstop=4|set shiftwidth=4
autocmd FileType asm set tabstop=8|set shiftwidth=8
autocmd FileType s set tabstop=8|set shiftwidth=8 expandtab

" Easy window navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

nnoremap S diw"0P

" auto-change directory to current buffer
" autocmd BufEnter * :cd %:p:h

" Quickly edit/reload the vimrc file
nmap <silent> <leader>ev :e ~/.vim/vimrc<CR>
nmap <silent> <leader>sv :so ~/.vim/vimrc<CR>

command! -nargs=+ Calc :py print <args>
py from math import *

set tags=~/code/amiga/tbl-newage/tags
cd ~/code/amiga/tbl-newage

" disable <F1>-Helpkey and map it to <ESC>
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>
let g:ctrlp_map = '<c-r>'
let g:ctrlp_cmd = 'CtrlP'
let g:airline_theme="wombat"

" map <C-h> :nohl<cr>
" imap <C-l> :<Space>
" imap <C-n> <tab>
map <C-s> <esc>:w<CR>
imap <C-s> <esc>:w<CR>
" map <C-x> <C-w>c
" map <C-n> :cn<CR>
" map <C-p> :cp<CR>


