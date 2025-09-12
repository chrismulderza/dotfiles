# 10-env.bash 
# created: 2025-09-11
# updated: 2025-09-11
#
# Configure environment

# PATH 
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]
then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi

MANPATH=/usr/share/man

# Test for optional paths (For now check /usr/local/bin where Homebrew installs)
if [ -d /usr/local/bin ]; then
  PATH=$PATH:/usr/local/bin:/usr/local/sbin
  MANPATH=$MANPATH:/usr/local/share/man
fi

export PATH MANPATH
