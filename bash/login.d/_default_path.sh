# Setup basic paths

_debug "FILE: _default_path.sh"

PATH=${HOME}/bin:/bin:/sbin:/usr/bin:/usr/sbin
MANPATH=/usr/share/man

# Test for optional paths (For now check /usr/local/bin where Homebrew installs)
if [ -d /usr/local/bin ]; then
  PATH=/usr/local/bin:/usr/local/sbin:$PATH
  MANPATH=/usr/local/share/man:$MANPATH
fi

export PATH MANPATH
