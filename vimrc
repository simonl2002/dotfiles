set nocompatible

" pathogen plugin handling.
" note: it needs filetype to be off
filetype on
filetype off
call pathogen#infect()

"turn filetype stuff back on
filetype plugin indent on

set backspace=indent,eol,start
set ruler
set history=100
set number
set nowrap
set showcmd		" display incomplete commands
set incsearch		" do incremental searching

" set all the tab stuff
set expandtab
set shiftwidth=4
set softtabstop=4
set tabstop=4

" Enable CTRL-A/CTRL-X to work on octal and hex numbers, as well as characters
set nrformats=octal,hex,alpha

"load smarty template
au BufRead,BufNewFile *.tpl set filetype=smarty

"handle jsp include
au BufRead,BufNewFile *.jinc set filetype=jsp

autocmd FileType python setlocal expandtab

" switch to upper/lower window quickly
map <C-J> <C-W>j
map <C-K> <C-W>k
map <C-H> <C-W>h
map <C-L> <C-W>l

" use CTRL-F for omni completion
imap <C-F> 

if $ISMEETUP
    set path=/usr/local/meetup/src/**,/usr/local/meetup/base_src/**,/usr/local/meetup/web/**,/usr/local/meetup/util/**
    :color default
else
    ":color darkblue
endif

syntax on

"VimClojure Settings
let vimclojure#HighlightBuiltins=1
let vimclojure#ParenRainbow=1

"turn on wildmenu
set wildmenu

" always show status line
set laststatus=2

" adding fancy git info to status line
if exists('g:loaded_fugitive')
    set statusline=%t\ [b%n]\ %y%m%r\ %{fugitive#statusline()}%=[%B]\ %l,%c%V\ %P
endif
