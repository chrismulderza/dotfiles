# 70-extensions.bash
# created: 2025-09-11
# updated: 2025-09-11
#
# direnv
# TODO - Fix detection. POSIX style
if which direnv &>/dev/null; then
    eval "$(direnv hook bash)"
fi

# Load any shell hooks last
#
# direnv
# eval "$(direnv hook bash)"
#test -f "$(which direnv)" && eval "$(direnv hook bash)"

# git

# sdkman
#test -f ~/.sdkman/bin/sdkman-init.sh && source "$_"
