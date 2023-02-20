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
"Plug 'phanviet/vim-monokai-pro'

Plug 'elemecca/dockerfile.vim'

"Plug 'ludovicchabant/vim-gutentags'

" Nerd commenter
Plug 'preservim/nerdcommenter'

Plug 'pearofducks/ansible-vim'

Plug 'hashivim/vim-terraform'

Plug 'ludovicchabant/vim-gutentags'
  let g:gutentags_cache_dir = '~/.tags_cache' 

Plug 'junegunn/fzf', {'dir': '~/.fzf', 'do': './install --all'}

call plug#end()
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

nmap <leader>ggn :GitGutterNextHunk<CR> 
nmap <leader>ggN :GitGutterPrevHunk<CR>
nmap <leader>gga :GitGutterStageHunk<CR> 
nmap <leader>ggu :GitGutterUndoHunk<CR>

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
"let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
"let g:ale_sign_error = '✘'
"let g:ale_sign_warning = '⚠'
"let g:ale_lint_on_text_changed = 'never'
" ----------------------------------------
" /ALE
" ----------------------------------------

" ----------------------------------------
" Colors etc
" ----------------------------------------
set background=dark
set termguicolors
"colorscheme monokai_pro
colorscheme kanagawa
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
"  Mouse etc
" ----------------------------------------
set mouse=a

" ----------------------------------------
" Status line stuff etc
" loaded from .vimrc
" ----------------------------------------
set showmode
set laststatus=2
"set statusline=%<%F\ %h%m%r%=%-14.(%l,%c%V%)\ %P
set statusline=%<%F\ %m%r%=%(%l,%c%)\ %P
set clipboard=unnamed
set backspace=indent,eol,start

" ----------------------------------------
" Tags
" loaded from .vimrc
" ----------------------------------------
set tags=./tags;
"set statusline+=%{gutentags#statusline()}

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
"nnoremap <F5> :buffers<CR>:buffer<Space>

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
" JSON etc
" ----------------------------------------
let g:vim_json_syntax_conceal=0
let g:markdown_syntax_conceal=0

" ----------------------------------------
" PYENV etc
" dont forget to chnage this see 
" https://github.com/deoplete-plugins/deoplete-jedi/wiki/Setting-up-Python-for-Neovim#using-virtual-environments
" for info
" ----------------------------------------

let g:python3_host_prog = '~/.pyenv/versions/nvim3-10/bin/python'

" ----------------------------------------
" general lua based config calls
" moving general options etc into
" lua files under ./lua
" ----------------------------------------
lua <<
    require('mason').setup()
    require('mason-lspconfig').setup {
        ensure_installed = { "gopls", "rust_analyzer", "pylsp", "ruby_ls", "yamlls", "dockerls" },
    }
    require('lsp_diag')
    require('plug')
    require('opts')
    require('keys')
    require("neodev").setup({
        library = { 
            plugins = { "neotest", "nvim-dap-ui" }, types = true },
    })
    require('plugin_config')
    -- LSP
    require("rust-tools")
    require('lsp-dap')
    -- Notify
    --require('notify').setup()
    require('notify')
    -- Neotest
    require('neotest_conf')
    --require('neotest').setup({adapters = {"neotest-python"} })
        -- DAP
    require('dap-python').setup('~/.pyenv/versions/nvim3-10/bin/python')
    require('dap-conf')
    require("dapui").setup()
.

