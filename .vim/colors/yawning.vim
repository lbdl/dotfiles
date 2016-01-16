" Vim color file
" Maintainer:	Bram Moolenaar <Bram@vim.org>
" Modified:    T E Storey
" Last Change:	2006 Apr 15
" Last Change: 2011 Nov 18

" This color scheme uses a light grey background.

" First remove all existing highlighting.
set background=light
hi clear
if exists("syntax_on")
  syntax reset
endif

let colors_name = "yawning"

"hi Normal ctermfg=Black ctermbg=LightGrey guifg=Black guibg=Grey90
"hi Normal guifg=Black guibg=white
" Groups used in the 'highlight' and 'guicursor' options default value.
hi ErrorMsg term=standout ctermbg=DarkRed ctermfg=White guibg=Red guifg=White
hi IncSearch term=reverse cterm=reverse gui=reverse
hi ModeMsg term=bold cterm=bold gui=bold
hi StatusLine term=reverse,bold cterm=reverse,bold ctermbg=Green guibg=darkcyan gui=reverse,bold
hi StatusLineNC term=reverse cterm=reverse gui=reverse
hi VertSplit term=reverse cterm=reverse gui=reverse
"hi Visual term=reverse ctermbg=grey guibg=grey80
hi Visual  ctermbg=grey ctermfg=White guibg=grey80
hi VisualNOS term=underline,bold cterm=underline,bold gui=underline,bold
hi DiffText term=reverse cterm=bold ctermbg=Red gui=bold guibg=Red
hi Cursor  guibg=Green guifg=NONE ctermbg=Green
hi iCursor guibg=DarkGreen guifg=NONE
hi lCursor ctermbg=Green  guibg=DarkGreen ctermbg=Cyan guifg=NONE
hi Directory term=bold ctermfg=DarkBlue guifg=Blue
hi LineNr term=underline ctermfg=Black guifg=Black
hi MoreMsg term=bold ctermfg=DarkGreen gui=bold guifg=SeaGreen
"hi NonText term=bold ctermfg=Blue gui=bold guifg=Blue guibg=LightGrey 
hi NonText term=bold ctermfg=Blue gui=bold guifg=Blue 
"hi NonText term=bold ctermfg=Blue gui=bold guifg=Blue  
hi Question term=standout ctermfg=DarkGreen gui=bold guifg=SeaGreen
hi Search term=reverse ctermbg=Yellow ctermfg=NONE guibg=Yellow guifg=NONE
hi SpecialKey term=bold ctermfg=DarkBlue guifg=Blue
hi Title term=bold ctermfg=DarkMagenta gui=bold guifg=Magenta
hi WarningMsg term=standout ctermfg=DarkRed guifg=Red
hi WildMenu term=standout ctermbg=Yellow ctermfg=Black guibg=Yellow guifg=Black
hi Folded term=standout ctermbg=Grey ctermfg=DarkBlue guibg=LightGrey guifg=DarkBlue
hi FoldColumn term=standout ctermbg=Grey ctermfg=DarkBlue guibg=Grey guifg=DarkBlue
hi DiffAdd term=bold ctermbg=LightBlue guibg=LightBlue
hi DiffChange term=bold ctermbg=LightMagenta guibg=LightMagenta
hi DiffDelete term=bold ctermfg=Blue ctermbg=LightCyan gui=bold guifg=Blue guibg=LightCyan
hi CursorLine term=underline cterm=underline guibg=grey80
hi CursorColumn term=reverse ctermbg=grey guibg=grey80
hi Identifier term=underline ctermfg=0 cterm=bold gui=bold guifg=Black
hi cEnum term=underline ctermfg=0 guifg=Black
hi simpleType term=bold ctermfg=Green guifg=darkcyan gui=bold
hi Function term=underline ctermfg=0
" Colors for syntax highlighting
"hi Constant term=underline ctermfg=DarkRed guifg=Magenta guibg=Grey90
hi Constant term=underline ctermfg=DarkRed guifg=Magenta 
hi Special term=bold ctermfg=DarkMagenta guifg=SlateBlue guibg=Grey90
"hi Special term=bold ctermfg=DarkMagenta guifg=SlateBlue 
hi Statement term=bold ctermfg=0 cterm=bold  gui=bold guifg=Black
hi type term=bold ctermfg=3 cterm=bold gui=bold guifg=darkgreen
hi cType term=bold ctermfg=3 cterm=bold gui=bold guifg=darkcyan
"hi Type term=bold ctermfg=Brown cterm=bold gui=bold guifg=Blue
if &t_Co > 8
  hi Statement term=bold cterm=bold ctermfg=Black gui=bold guifg=Black§:w
  
endif
hi Ignore ctermfg=LightGrey guifg=grey90

" vim: sw=2
