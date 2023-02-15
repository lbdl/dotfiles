if not command -s rbenv > /dev/null
    echo "Install <github.com/yyuu/rbenv> to use 'rbenv'."
    exit 1
end

set -l rbenv_root ""

if test -z "$rbenv_ROOT"
    set rbenv_root ~/.rbenv
    set -x rbenv_ROOT "$rbenv_root"
else
    set rbenv_root "$rbenv_ROOT"
end

if status --is-login
    set -x PATH "$rbenv_root/shims" $PATH
    set -x RBENV_SHELL fish
end
command mkdir -p "$rbenv_root/"{shims,versions}
