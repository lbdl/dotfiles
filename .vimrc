
" --------------------
" Pathogen shizzle
" --------------------
execute pathogen#infect()
filetype plugin indent on

set number
"move to a sensible work dir
"cd ~/DATA/score
"
"set a common swap file location
set dir=~/DATA/swap
set wrap
syntax enable
set t_Co=256
set number

" ----------------------------------------
" Colorscheme setting  
" We are using solarized which needs to have
" the solarozed theme installed as we also use
" iTerm2 so it needs to be imported and then
" set on the default (or given) profile.
" Its held locally (on coot03) but can be
" obtained from http://ethanschoonover.com/solarized
" which details ALL THE THINGS
" ----------------------------------------
set background=dark
colorscheme solarized

set showmode
set laststatus=2
set statusline=%<%F\ %h%m%r%=%-14.(%l,%c%V%)\ %P
set clipboard=unnamed

set backspace=indent,eol,start

set nocompatible
set ofu=syntaxcomplete#Complete

set gfn=Menlo:h11
set noerrorbells
set visualbell
set tabstop=4
set shiftwidth=4
set softtabstop=4
set noexpandtab
set smartindent
set autoindent
set incsearch
set showmatch
set guioptions-=T
set guioptions-=L
set guioptions-=R

"need the following line to disable annoying $() being flagged as error
"in shell scripts...
let g:is_posix = 1


if &term =~ '256color'
  " disable Background Color Erase (BCE)
  set t_ut=
endif

"reload .vimrc if changed
augroup vimrcReloader
    au!
    autocmd BufWritePost .vimrc source %
augroup END

"the below should fix the annoying Makefile crap where we don't get tabs
autocmd BufEnter ?akefile* set noet ts=4 sw=4

" --------------------
" LaTex shizzle
" --------------------
let g:tex_flavor='latex'



