" ----------------------------------------
" Pathogen shizzle
" ----------------------------------------
execute pathogen#infect()
filetype plugin indent on

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

if &term =~ '256color'
  " disable Background Color Erase (BCE)
  set t_ut=
endif

" ----------------------------------------
" LaTex shizzle
" ----------------------------------------
let g:tex_flavor='latex'

" ----------------------------------------
" Backup and Swaps
" These need to be made if they dont exist.
" ----------------------------------------
set directory=$HOME/.vimbk
set backupdir=$HOME/.vimbk
"
" ----------------------------------------
" Tab stops spaces etc
" ----------------------------------------
set expandtab
set tabstop=2 shiftwidth=2 softtabstop=2
set autoindent

