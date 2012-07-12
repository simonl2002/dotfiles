set nocompatible

" pathogen plugin handling.
" note: it needs filetype to be off
filetype on
filetype off
call pathogen#infect()

"turn filetype stuff back on
filetype plugin indent on

" leader character is a comma
let mapleader = ","
let maplocalleader = ","

"set hidden " better multi-buffer handling
set backspace=indent,eol,start
set ruler
set history=1000
set number
set nowrap
set showcmd		" display incomplete commands

set ignorecase " ignore case when searching
set smartcase  " though be smart if there are caps
set hlsearch    " highlight searches
set incsearch		" do incremental searching

" quick turning off of highlight search
nmap <silent> <leader>n :silent :nohlsearch<CR>

set scrolloff=3  " cursor context when scrolling

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
autocmd FileType java setlocal noexpandtab

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

    " Map <F4> to re-build tags file
     nmap <silent> <F4> 
                 \ :!ctags -f ~/.meetup_tags
                 \ -R 
                 \  /usr/local/meetup/src/ /usr/local/meetup/base_src/ /usr/local/meetup/marketplace_src/<CR>
    
    set tags=~/.meetup_tags
else
    ":color darkblue
endif

syntax on

"VimClojure Settings
let vimclojure#HighlightBuiltins=1
let vimclojure#ParenRainbow=1
let vimclojure#FuzzyIndent=1
let vimclojure#WantNailgun=1


"turn on wildmenu
set wildmenu
set wildmode=longest,full

" always show status line
set laststatus=2

" adding fancy git info to status line if fugitive is present
autocmd VimEnter * if exists('g:loaded_fugitive') | set statusline=%t\ [b%n]\ %y%m%r\ %{fugitive#statusline()}%=[%B]\ %l,%c%V\ %P |

" When editing a file, always jump to the last known cursor position.
" Don't do it when the position is invalid or when inside an event handler
" (happens when dropping a file on gvim).
autocmd BufReadPost *
  \ if line("'\"") > 0 && line("'\"") <= line("$") |
  \   exe "normal g`\"" |
  \ endif
