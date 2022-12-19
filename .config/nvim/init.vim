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


"Plug 'deoplete-plugins/deoplete-docker'
Plug 'elemecca/dockerfile.vim'

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }



Plug 'ludovicchabant/vim-gutentags'

" Nerdtree
Plug 'preservim/nerdtree'

" Nerd commenter
Plug 'preservim/nerdcommenter'

Plug 'pearofducks/ansible-vim'

Plug 'hashivim/vim-terraform'

" some code completions via  LSP
Plug 'neoclide/coc.nvim', {'tag': '*'}

" Linter
Plug 'rust-lang/rust.vim'

Plug 'ludovicchabant/vim-gutentags'
  let g:gutentags_cache_dir = '~/.tags_cache' 

Plug 'junegunn/fzf', {'dir': '~/.fzf', 'do': './install --all'}
Plug 'junegunn/fzf.vim'
Plug 'fatih/vim-go'
Plug 'timonv/vim-cargo'
Plug 'rust-lang/rust.vim'



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

nnoremap <leader>gs :Magit<CR>

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

