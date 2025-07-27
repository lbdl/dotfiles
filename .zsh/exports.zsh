# NOTE we clear the PATH var in .zshenv

# Setup terminal, and turn on colors
export CLICOLOR=1
export LSCOLORS=Gxfxcxdxbxegedabagacad

# Enable color in grep
export GREP_OPTIONS='--color=auto'
export GREP_COLOR='3;33'

export LESS='--ignore-case --raw-control-chars'
export PAGER='less'
export EDITOR='subl -w'

# CTAGS Sorting in VIM/Emacs is better behaved with this in place
export LC_COLLATE=C 

