call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

set nocompatible

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
map <F5> :!/Users/daniel/code/amiga/tbl-newage/tundra-output/macosx-gcc-debug-default/NecrosisTest<CR><ESC>
set makeprg=tundra\ macosx-gcc-debug

set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P
set laststatus=2

set guioptions=-t 

syntax enable
colorscheme dusk 

au BufNewFile,BufRead *.frag,*.vert,*.fp,*.vp,*.glsl setf glsl

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
set wildignore=*.swp,*.bak,*.pyc,*.class
set title                " change the terminal's title
set visualbell           " don't beep
set noerrorbells         " don't beep

set nobackup
set noswapfile

set guifont=ProggyClean:h11
set noanti
set linespace=2

autocmd FileType lisp set tabstop=2|set shiftwidth=2|set expandtab
autocmd FileType c set tabstop=4|set shiftwidth=4
autocmd FileType objc set tabstop=4|set shiftwidth=4

" Easy window navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" auto-change directory to current buffer
" autocmd BufEnter * :cd %:p:h

" Quickly edit/reload the vimrc file
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

command! -nargs=+ Calc :py print <args>
py from math import *

set tags=~/code/amiga/tbl-newage/tags
cd ~/code/amiga/tbl-newage

" Ruby stuff
autocmd FileType ruby compiler ruby


