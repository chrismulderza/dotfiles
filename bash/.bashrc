# Bash configuration file				    -*- shell-script -*-
# ex: ts=2 sw=2 et filetype=sh

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# System optional paths
PATH="/usr/local/bin:$PATH"

# User scripts and binaries
#
# Check if ~/.local/bin is on the path and prepend it
if ! [[ "$PATH" =~ "${HOME}/.local/bin" ]]
then
    PATH="${HOME}/.local/bin:$PATH"
fi
# Check if ~/.local/bin is on the path and prepend it
if ! [[ "$PATH" =~ "${HOME}/bin:" ]]
then
    PATH="${HOME}/bin:$PATH"
fi

if [ -d $HOME/opt/bin ]; then
  PATH="$PATH:$HOME/opt/bin"
fi
export PATH



# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
function loadrc () {
  shopt -s nullglob dotglob
  for rc in "$1"/*; do
    if [ -d "$rc" ]; then
      loadrc "$rc"
    else
      . "$rc"
    fi
  done
  unset rc
}

if [ -d ~/.bashrc.d ]; then
  loadrc ~/.bashrc.d
fi
