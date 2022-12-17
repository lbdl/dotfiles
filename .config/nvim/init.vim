"==========================================================
"Loading .vimrc
"==========================================================

"set runtimepath^=~/.vim runtimepath+=~/.vim/after
"    let &packpath = &runtimepath
"    source ~/.vimrc

"==========================================================
" Plugins
"==========================================================
call plug#begin('~/.config/nvim/plugged')

" Colorscheme
"Plug 'morhetz/gruvbox'
Plug 'phanviet/vim-monokai-pro'
Plug 'sheerun/vim-polyglot'
" Deoplete completions

Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

" Deoplete bindings for python
Plug 'deoplete-plugins/deoplete-jedi'

Plug 'preservim/nerdcommenter'
"Plug 'preservim/nerdtree'
" Phoenix
"Plug 'c-brenn/phoenix.vim'
"Plug 'tpope/vim-projectionist' " required for some navigation features

Plug 'ludovicchabant/vim-gutentags'
  let g:gutentags_cache_dir = '~/.tags_cache' 

Plug 'junegunn/fzf', {'dir': '~/.fzf', 'do': './install --all'}
Plug 'junegunn/fzf.vim'
Plug 'fatih/vim-go'
"Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Buffer management
Plug 'timonv/vim-cargo'
Plug 'rust-lang/rust.vim'
" Execute code checks, find mistakes, in the background
"Plug 'neomake/neomake'
  "" Run Neomake when I save any buffer
  "augroup localneomake
    "autocmd! BufWritePost * 
          "\Neomake
  "augroup END
  "" Don't tell me to use smartquotes in markdown ok?
  "let g:neomake_markdown_enabled_makers = []
  "" Configure a nice credo setup, courtesy https://github.com/neomake/neomake/pull/300
"  let g:neomake_elixir_enabled_makers = ['mix', 'credo']

" Linter

" GOLANG debugging
" set to 1, nvim will open the preview window after entering the markdown buffer
" default: 0
" set to 1, the vim will refresh markdown when save the buffer or
" leave from insert mode, default 0 is auto refresh markdown as you edit or
" move the cursor
" default: 0

"Plug 'weirongxu/plantuml-previewer.vim'

"Plug 'tyru/open-browser.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" GOLANG package func searching

call plug#end()

" ----------------------------------------
" Python pyenv for deoplete
" ----------------------------------------
let g:python_host_prog = '/usr/bin/python2'
let g:python3_host_prog = '/usr/bin/python3'


" ----------------------------------------
" Deoplete
" ----------------------------------------
let g:deoplete#enable_at_startup = 1

" ----------------------------------------
" Magit and GitGutter Key bindings
" ----------------------------------------
"control the speed of the gutter update
set updatetime=250 
let g:gitgutter_sign_added='++'
let g:gitgutter_sign_modified='>'
let g:gitgutter_sign_removed='--'
let g:gitgutter_sign_removed_first_line='^'
let g:gitgutter_sign_modified_removed='<'

nmap <leader>gn :GitGutterNextHunk<CR> 
nmap <leader>gN :GitGutterPrevHunk<CR>
nmap <leader>ga :GitGutterStageHunk<CR> 
nmap <leader>gu :GitGutterUndoHunk<CR>

" ----------------------------------------
" Colors etc
" ----------------------------------------
set background=dark
set termguicolors
colorscheme monokai_pro
set wrap

" ----------------------------------------
" Numbers etc
" ----------------------------------------
set title

" ----------------------------------------
" Encoding etc
" ----------------------------------------
set encoding=utf-8

" ----------------------------------------
" Error bells etc
" loaded from .vimrc
" ----------------------------------------
set vb  "no error bells visual nor audio

" ----------------------------------------
" Swap files etc
" we dont want swap files at the moment
" ----------------------------------------
set noswapfile
" Don't make a backup before overwriting a file.
set nobackup
" And again.
set nowritebackup

" ----------------------------------------
" Map leaders etc
" loaded from .vimrc
" ----------------------------------------
let mapleader = ";"

" ----------------------------------------
" Tags
" loaded from .vimrc
" ----------------------------------------
set tags=./tags;
set statusline+=%{gutentags#statusline()}

" ----------------------------------------
"  Mouse etc
" ----------------------------------------
set mouse=a

" ----------------------------------------
" Status line stuff etc
" loaded from .vimrc
" ----------------------------------------
set showmode
set laststatus=2
set statusline=%<%F\ %h%m%r%=%-14.(%l,%c%V%)\ %P
set clipboard=unnamed
set backspace=indent,eol,start


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

augroup filetype_tex
    autocmd!
    autocmd FileType tex set spell spelllang=en_gb
augroup END

" ----------------------------------------
" Searching etc
" ----------------------------------------
set hlsearch
set incsearch
set ignorecase
" Ignore case when searching lowercase
set smartcase
" Stop highlighting on Enter
map <CR> :noh<CR>

" ----------------------------------------
" Buffers etc
" ----------------------------------------
nnoremap <F5> :buffers<CR>:buffer<Space>

" ----------------------------------------
" GOLANG configs
" ----------------------------------------
au FileType go set noexpandtab
au FileType go set shiftwidth=4
au FileType go set softtabstop=4
au FileType go set tabstop=4
let g:go_highlight_build_constraints = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_structs = 1
let g:go_highlight_types = 1


" ----------------------------------------
" general lua based config calls
" moving general options etc into
" lua files under ./lua
" ----------------------------------------
lua <<
    require('mason').setup()
    require('lsp_diag')
    require('plug')
    require('opts')
    require('keys')
    require('plugin_config')
.

