# NOTE we clear the PATH var in .zshenv
#
#export PATH=$PATH~/bin:/usr/local/bin:/usr/local/sbin:~/bin
# Set default console Java to 1.6
#export JAVA_HOME=/System/Library/Frameworks/JavaVM.framework/Versions/1.6/Home

# Setup terminal, and turn on colors
export TERM=xterm-256color
export CLICOLOR=1
export LSCOLORS=Gxfxcxdxbxegedabagacad

# Enable color in grep
export GREP_OPTIONS='--color=auto'
export GREP_COLOR='3;33'

# This resolves issues install the mysql, postgres, and other gems with native non universal binary extensions
#export ARCHFLAGS='-arch x86_64'

export LESS='--ignore-case --raw-control-chars'
export PAGER='less'
export EDITOR='subl -w'

#export NODE_PATH=/opt/github/homebrew/lib/node_modules
#export PYTHONPATH=/usr/local/lib/python2.6/site-packages
# CTAGS Sorting in VIM/Emacs is better behaved with this in place
export LC_COLLATE=C 

#export GH_ISSUE_CREATE_TOKEN=083f60c674d8eb41f98258df9fc8d94cb733218a

# Virtual Environment Stuff
#export WORKON_HOME=~/.ve
#export PROJECT_HOME=~/DATA/PY

#both PYENV and RBENV use shims that get added to the front of $PATH
#so we cant use both of them together. Boo
#eval "$(rbenv init -)"
