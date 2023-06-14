direnv hook fish | source

source (pyenv init - | psub)
source (pyenv virtualenv-init - | psub)
status --is-interactive; and rbenv init - fish | source


# nvm stuff
set nvm_path ~/.nvm
if test -d "$nvm_path" #? have we got this directory
    set -x NVM_DIR ~/.nvm
    if test -s "$nvm_path/nvm.sh" #? have we got this file
        function nvm 
            bass source (brew --prefix nvm)/nvm.sh --no-use ';' nvm $argv
        end
    nvm use default --silent
    end
else
    echo "Cant find ~/.nvm have you done 'brew install nvm' ?"
end

rbenv rehash >/dev/null 2>&1

# Change prompt
functions -c fish_prompt _old_fish_prompt
function fish_prompt
  if set -q VIRTUAL_ENV
    echo -n -s (set_color -b yellow black) "(" (basename "$VIRTUAL_ENV") ")" (set_color normal) " "
  end
  _old_fish_prompt
end

#test -e /Users/tims/.iterm2_shell_integration.fish ; and source /Users/tims/.iterm2_shell_integration.fish ; or true
