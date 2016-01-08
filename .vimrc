set wrap
syntax on
set t_Co=256
set number
filetype indent on
filetype plugin on

set showmode
set laststatus=2
set statusline=%<%F\ %h%m%r%=%-14.(%l,%c%V%)\ %P
set clipboard=unnamed
colorscheme darcula

set backspace=indent,eol,start

if &term =~ '256color'
  " disable Background Color Erase (BCE)
  set t_ut=
endif

" --------------------
" Pathogen shizzle
" --------------------
execute pathogen#infect()

" --------------------
" LaTex Pathogen shizzle
" --------------------
let g:tex_flavor='latex'
