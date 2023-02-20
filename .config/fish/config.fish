direnv hook fish | source

source (pyenv init - | psub)
source (pyenv virtualenv-init - | psub)
status --is-interactive; and rbenv init - fish | source

rbenv rehash >/dev/null 2>&1

# Change prompt
functions -c fish_prompt _old_fish_prompt
function fish_prompt
  if set -q VIRTUAL_ENV
    echo -n -s (set_color -b blue white) "(" (basename "$VIRTUAL_ENV") ")" (set_color normal) " "
  end
  _old_fish_prompt
end

#test -e /Users/tims/.iterm2_shell_integration.fish ; and source /Users/tims/.iterm2_shell_integration.fish ; or true
