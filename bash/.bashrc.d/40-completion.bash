# 40-completion.bash
# created: 2025-09-11
# updated: 2025-09-11
#
# Completions

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
    if [ -f /usr/share/bash-completion/bash_completion ]; then
        . /usr/share/bash-completion/bash_completion
    elif [ -f /etc/bash_completion ]; then
        . /etc/bash_completion
    fi
fi

# Merge from MacOS branch

# Source bash completions
#
#
# Source the standard bash completions framework
#test -f /opt/homebrew/etc/bash_completion && source "$_"
# On MacOS using Homebrew most completions are installed in
# /opt/homebrew/etc/bash_completion.d/

# homebrew
#test -f /opt/homebrew/etc/bash_completion.d/brew && source "$_"
#test -f /opt/homebrew/etc/bash_completion.d/brew-services && source "$_"

# alacritty
#test -f /opt/homebrew/etc/bash_completion.d/alacritty && source "$_"

# pass
#test -f /opt/homebrew/etc/bash_completion.d/pass && source "$_"

# pass-otp
#test -f /opt/homebrew/etc/bash_completion.d/pass-otp && source "$_"

# podman
#test -f /opt/homebrew/etc/bash_completion.d/podman && source "$_"

# yt-dlp
#test -f /opt/homebrew/etc/bash_completion.d/yt-dlp && source "$_"

# yt-dlp
#test -f /opt/homebrew/etc/bash_completion.d/gcalcli && source "$_"

# Custom completions
# These completions live in ~/dotfiles/bash/completion
#
# ilab
#test -f ~/dotfiles/bash/completion/ilab.bash && source "$_"

# OpenShift Client
#test -f ~/dotfiles/bash/completion/oc.bash && source "$_"

# Jbang
#test -f ~/dotfiles/bash/completion/jbang.bash && source "$_"

# Quarkus
#test -f ~/dotfiles/bash/completion/quarkus.bash && source "$_"
