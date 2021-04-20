source ~/.config/fish/fish_aliases
source ~/.config/fish/fish_vars
direnv hook fish | source

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
# eval //anaconda3/bin/conda "shell.fish" "hook" $argv | source
# <<< conda initialize <<<



# pyenv init
if command -v pyenv 1>/dev/null 2>&1
  pyenv init - | source
end
