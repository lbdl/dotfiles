--[[ opts.lua ]]
local opt = vim.opt -- with vim.opt we can set global, window and buffer settings, acting like :set in vimscript
local set = vim.opt
local o = vim.o
local cmd = vim.api.nvim_command

-- indents
vim.cmd([[
set tabstop=4                 
set expandtab 
set shiftwidth=4
set smartindent
]])


-- turn off macro's
vim.cmd([[
set spelllang=en_gb
]])


opt.number = true -- bool: Show line numbers
opt.relativenumber = true -- bool: Show relative line numbers
opt.scrolloff = 4 -- int:  Min num lines of context
opt.signcolumn = "yes" -- str:  Show the sign column
opt.numberwidth = 4 -- gutter width
set.cursorline = true -- display cursor line
set.cursorlineopt = 'number' --


-- [[ Filetypes ]]
opt.encoding = 'utf8' -- str:  String encoding to use
opt.fileencoding = 'utf8' -- str:  File encoding to use


-- [[ Theme ]]
opt.syntax = "ON" -- str:  Allow syntax highlighting
opt.termguicolors = true -- bool: If term supports ui color then enable


-- [[ Search ]]
opt.ignorecase = true -- bool: Ignore case in search patterns
opt.smartcase = true -- bool: Override ignorecase if search contains capitals
opt.incsearch = true -- bool: Use incremental search
opt.hlsearch = false -- bool: Highlight search matches


-- [[ Whitespace ]]
opt.expandtab = true -- bool: Use spaces instead of tabs
opt.shiftwidth = 4 -- num:  Size of an indent
opt.softtabstop = 4 -- num:  Number of spaces tabs count for in insert mode
opt.tabstop = 4 -- num:  Number of spaces tabs count for


-- [[ Splits ]]
opt.splitright = true -- bool: Place new window to right of current one
opt.splitbelow = true -- bool: Place new window below the current one


-- Format on Save

--vim.cmd([[autocmd BufWritePre * if &ft!="asciidoc" || &ft!="lua" | lua vim.lsp.buf.formatting_sync() | endif ]])

-- Vimtest
--vim.cmd([[
--"let test#strategy = "asyncrun_background"
--"let test#strategy = "floaterm"
--]])


--Set completeopt to have a better completion experience
-- :help completeopt
-- menuone: popup even when there's only one match
-- noinsert: Do not insert text until a selection is made
-- noselect: Do not select, force to select one from the menu
-- shortness: avoid showing extra messages when using completion
-- updatetime: set updatetime for CursorHold
vim.opt.completeopt = {'menuone', 'noselect', 'noinsert'}
vim.opt.shortmess = vim.opt.shortmess + { c = true}
vim.api.nvim_set_option('updatetime', 300) 


-- Treesitter folding-- 
--vim.wo.foldmethod = 'expr'
--vim.wo.foldexpr = 'nvim_treesitter#foldexpr()'

-- Fixed column for diagnostics to appear
-- Show autodiagnostic popup on cursor hover_range
-- Goto previous / next diagnostic warning / error
-- Show inlay_hints more frequently
vim.o.updatetime = 250
set.signcolumn = 'yes'
vim.cmd([[
autocmd CursorHold * lua vim.diagnostic.open_float(nil, { focusable = false })
]])
