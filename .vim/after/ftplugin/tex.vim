"   File: tex.vim
"   Name: T E Storey
"   Creation Date: 20120404
"
"
"
"   Purpose: overrides for latex-suite. The substitution of \dots for ...
"   is very annoying
"   EDIT: even more annoyingly the below does not work, you have to set the 
"   variables inside .vimrc
"

call IMAP('...', '...', 'tex')
let g:Tex_SmartKeyDot = 0
