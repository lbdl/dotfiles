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
Plug 'morhetz/gruvbox'

" Deoplete completions
"Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

"Plug 'deoplete-plugins/deoplete-docker'
Plug 'elemecca/dockerfile.vim'

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
" Deoplete bindings for python
"Plug 'deoplete-plugins/deoplete-jedi'

" Asciidoc syntax extentions
Plug 'habamax/vim-asciidoctor'
" Phoenix
"Plug 'c-brenn/phoenix.vim'
"Plug 'tpope/vim-projectionist' " required for some navigation features

Plug 'ludovicchabant/vim-gutentags'

" Nerdtree
Plug 'preservim/nerdtree'

" Nerd commenter
Plug 'preservim/nerdcommenter'

Plug 'pearofducks/ansible-vim'

Plug 'hashivim/vim-terraform'

" some code completions via  LSP
Plug 'neoclide/coc.nvim', {'tag': '*'}
    "let g:coc_global_extensions = ['coc-solargraph']
"Plug 'jvirtanen/vim-hcl'
" Buffer management

" Execute code checks, find mistakes, in the background
"Plug 'neomake/neomake'
  "" Run Neomake when I save any buffer
  "augroup localneomake
  "  autocmd! BufWritePost * 
  "       "Neomake
  "augroup END
  """ Don't tell me to use smartquotes in markdown ok?
  "let g:neomake_markdown_enabled_makers = []
  "" Configure a nice credo setup, courtesy https://github.com/neomake/neomake/pull/300
"  let g:neomake_elixir_enabled_makers = ['mix', 'credo']

" Linter
Plug 'rust-lang/rust.vim'
" GOLANG debugging
" set to 1, nvim will open the preview window after entering the markdown buffer
" default: 0
" set to 1, the vim will refresh markdown when save the buffer or
" leave from insert mode, default 0 is auto refresh markdown as you edit or
" move the cursor
" default: 0

"Plug 'weirongxu/plantuml-previewer.vim'

"Plug 'tyru/open-browser.vim'

" GOLANG package func searching

call plug#end()


" ----------------------------------------
" Python pyenv for deoplete
" ----------------------------------------
"let g:python_host_prog = '/Users/tims/.pyenv/versions/neovim2/bin/python'
"let g:python3_host_prog = '/Users/tims/.pyenv/versions/neovim3/bin/python'


" ----------------------------------------
" Deoplete
" ----------------------------------------
let g:deoplete#enable_at_startup = 1


" ----------------------------------------
" YAML
" ----------------------------------------
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
"let g:indentLine_char = '|'
let g:indentLine_char = '⦙'
" ----------------------------------------
" /YAML
" ----------------------------------------

" ----------------------------------------
" VAGRANT
" ----------------------------------------
augroup vagrant
    au!
    au BufRead,BufNewFile Vagrantfile set filetype=ruby
augroup END
" ----------------------------------------
" /VAGRANT
" ----------------------------------------

" ----------------------------------------
" FASTLANE
" ----------------------------------------
augroup fastlane
    au!
    au BufRead,BufNewFile Fastfile,Appfile set filetype=ruby
augroup END
" ----------------------------------------
" /FASTLANE
" ----------------------------------------

" ----------------------------------------
" ALE
" ----------------------------------------
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_sign_error = '✘'
let g:ale_sign_warning = '⚠'
let g:ale_lint_on_text_changed = 'never'
" ----------------------------------------
" /ALE
" ----------------------------------------

" ----------------------------------------
" Colors etc
" ----------------------------------------
set background=dark
colorscheme monokai
set wrap
set termguicolors
" ----------------------------------------
" Wintabs
" ----------------------------------------
" ----------------------------------------
" Numbers etc
" ----------------------------------------
set number
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
"set tags=./tags;
"set statusline+=%{gutentags#statusline()}
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
" Tab stops spaces etc
" loaded from .vimrc
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
"
"au FileType elixir
"    \setlocal tabstop=4
    
set tabstop=4                 
set expandtab   "soft tabs
set shiftwidth=4
set softtabstop=-1
set autoindent

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
" Keymaps etc
" ----------------------------------------
let NERDTreeShowHidden=1
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
" Working directories etc
" ----------------------------------------
"set autochdir
"
"
" ----------------------------------------
" Working directories PYENV etc
" ----------------------------------------

augroup filetype_tex
    autocmd!
    autocmd FileType tex set spell spelllang=en_gb
augroup END


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
