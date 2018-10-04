# this is all nicked from:
# zanshin.net/2013/02/02/zsh-configuration-from-the-ground-up

source ~/.zsh/checks.zsh
source ~/.zsh/colors.zsh
source ~/.zsh/setopt.zsh
source ~/.zsh/exports.zsh
source ~/.zsh/prompt.zsh
source ~/.zsh/completion.zsh
source ~/.zsh/aliases.zsh
source ~/.zsh/bindkeys.zsh
source ~/.zsh/functions.zsh
source ~/.zsh/history.zsh
source ~/.zsh/zsh_hooks.zsh
#source  ${HOME}/.dotfiles/z/z.sh
eval "$(pyenv init -)"
#note we need the below as if we use the installation instructions
#eval blah blah then we get the wrong path and shims cannot be found
#same is true for rbenv the pyenv shim must be at the front of the PATH
#variable
pyenv virtualenvwrapper_lazy
