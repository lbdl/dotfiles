" ----------------------------------------
" Pathogen shizzle
" ----------------------------------------
"execute pathogen#infect()
"filetype plugin indent on
"
"set wrap
"syntax enable
"set t_Co=256
"set number
"set vb  "no error bells visual nor audio

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
" Tex9 configuration for LaTex
" We are using XeTex as the compiler and
" Skim as the .pdf viewer
" ----------------------------------------
let g:tex_flavor='latex'
let g:tex_nine_config = {
      \'compiler': 'xelatex',
      \'shell_escape': 1,
      \'viewer': {'app': 'open -a Skim', 'target': 'pdf'}, 
      \}

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
au BufNewFile,BufRead *.py
    \set tabstop=4
    \set softtabstop=4
    \set shiftwidth=4
    \set textwidth=79
    \set expandtab
    \set autoindent
    \set fileformat=unix
    \let python_highlight_all=1

au BufNewFile,BufRead *.js, *.html, *.css
    \set tabstop=2
    \set softtabstop=2
    \set shiftwidth=2

set expandtab
set tabstop=2 shiftwidth=2 softtabstop=2
set autoindent

