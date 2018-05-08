 set nocompatible               " be iMproved
 filetype off                   " required!
 filetype plugin on

 set rtp+=~/.vim/bundle/vundle/
 call vundle#rc()

 " let Vundle manage Vundle
 " required!
Bundle 'Chiel92/vim-autoformat'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'Valloric/YouCompleteMe.git'
Bundle 'beyondmarc/hlsl.vim'
" Bundle 'bling/vim-airline'
Bundle 'gmarik/vundle'
Bundle 'gryf/kickass-syntax-vim'
Bundle 'jkozdon/vim-ispc'
Bundle 'jremmen/vim-ripgrep'
Bundle 'junegunn/fzf'
Bundle 'junegunn/fzf.vim'
Bundle 'petRUShka/vim-opencl.git'
Bundle 'rhysd/vim-clang-format'
Bundle 'rizzatti/dash.vim'
Bundle 'rizzatti/funcoo.vim'
Bundle 'rking/ag.vim'
Bundle 'rust-lang/rust.vim'
Bundle 'scrooloose/nerdtree.git'
Bundle 'scrooloose/syntastic'
Bundle 'tpope/vim-dispatch'
" Bundle 'vim-airline/vim-airline-themes'
Bundle 'vim-scripts/a.vim'
Bundle 'ctrlpvim/ctrlp.vim'
Bundle 'leafgarland/typescript-vim'

" export FZF_DEFAULT_COMMAND="rg --files"
"

set clipboard=unnamed

set tabstop=4
nnoremap <esc> :noh<return><esc>

function! s:QuickMake()
	let format = &errorformat	" capture current local efm
	:wall
	:silent!make
	let &efm=format " transfer error format to quickfix buffer
endfunction


" RustFmt stuff
let g:formatdef_rustfmt = '"/Users/danielcollin/.cargo/bin/rustfmt"'
let g:formatters_rust = ['rustfmt']

let g:ycm_rust_src_path = '/Users/danielcollin/code/other/rust/src'

let g:rustfmt_command = "cargo fmt -- "
let g:autoformat_verbosemode=1

command! -nargs=0 QuickMake :call s:QuickMake()

" nmap <F7> :make<CR>
nmap <F7> :QuickMake<CR>

" Use ripgrep to find the word under the cursor
nnoremap gr :grep <cword> *<CR>

" Use F8/F9 to jump between errors in the quickfix window
nmap <F8> :cnext<CR>
nmap <F9> :cprev<CR>
map <F10> :clist<CR>
map <F4> :!/Users/danielcollin/code/ProDBG/t2-output/macosx-clang-debug-default/ProDBG.app/Contents/MacOS/prodbg<CR><ESC>
set makeprg=scripts/mac_build_debug.sh

set laststatus=2

set guioptions=-t

syntax enable
colorscheme distinguished

au BufNewFile,BufRead *.frag,*.vert,*.fp,*.vp,*.glsl,*.fs setf glsl

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

" set guifont=ProggySquare:h11
set guifont=EssentialPragmataPro:h15
set noanti
set linespace=2

nmap <silent> <leader>d <Plug>DashSearch
nmap <silent> <Leader>f :Autoformat<CR>
" nmap <c-r> :Files<CR>

" autocmd FileType lisp set tabstop=2|set shiftwidth=2|set expandtab
autocmd FileType c set tabstop=4|set shiftwidth=4|set noexpandtab
autocmd FileType cpp set tabstop=4|set shiftwidth=4|set expandtab
autocmd FileType objc set tabstop=4|set shiftwidth=4
autocmd FileType asm set tabstop=8|set shiftwidth=8|set noexpandtab
autocmd FileType s set tabstop=8|set shiftwidth=8|set noexpandtab
autocmd FileType rs set tabstop=4|set shiftwidth=4
autocmd FileType sl set tabstop=8|set shiftwidth=8|set noexpandtab
autocmd BufNewFile,BufRead *.sl set syntax=asm68k
autocmd BufNewFile,BufRead *.s set syntax=asm68k
autocmd BufNewFile,BufRead *.i set syntax=asm68k
autocmd FileType rust compiler cargo
"autocmd FileType rust setl makeprg=cargo\ build

" Easy window navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" nnoremap S "_diwP
nnoremap S "_ciw<C-r>*<Esc>

" auto-change directory to current buffer
" autocmd BufEnter * :cd %:p:h

" Quickly edit/reload the vimrc file
nmap <silent> <leader>ev :e ~/.vim/vimrc<CR>
nmap <silent> <leader>sv :so ~/.vim/vimrc<CR>

command! -nargs=+ Calc :py print <args>
py from math import *

" set tags=~/code/prodbg/tags
" cd ~/code/prodbg/
" set makeprg=scripts/mac_build_debug.sh

" disable <F1>-Helpkey and map it to <ESC>
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>
let g:ctrlp_map = '<c-r>'
let g:ctrlp_cmd = 'CtrlP'
let g:airline_theme="wombat"
let g:airline_powerline_fonts = 1

map <C-s> <esc>:w<CR>
imap <C-s> <esc>:w<CR>

let g:ycm_always_populate_location_list = 1

" Trim traling whitesspaces

fun! TrimWhitespace()
    let l:save_cursor = getpos('.')
    %s/\s\+$//e
    call setpos('.', l:save_cursor)
endfun

" let g:ctrlp_custom_ignore = '\v\.(lock)$'

" Remove trating whitespaces on save

autocmd BufWritePre * :call TrimWhitespace()

if executable('rg')
  set grepprg=rg\ --color=never
  let g:ctrlp_user_command = 'rg %s --files --color=never --glob ""'
  let g:ctrlp_use_caching = 0
endif
