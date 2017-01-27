# Setup basic paths

_debug "FILE: _default_path.sh"

PATH=${HOME}/bin:/bin:/sbin:/usr/bin:/usr/sbin
MANPATH=/usr/share/man

# Test for optional paths (For now check /usr/local/bin where Homebrew installs)
if [ -d /usr/local/bin ]; then
  PATH=/usr/local/bin:/usr/local/sbin:$PATH
  MANPATH=/usr/local/share/man:$MANPATH
fi

if [ -d /Users/cmulder/tools/couchbase/4.1/couchbase-core/bin ]; then
    PATH=$PATH:/Users/cmulder/tools/couchbase/4.1/couchbase-core/bin
fi


if [ -d  /opt/oracle/client/11.2 ]; then
    PATH=$PATH:/opt/oracle/client/11.2
fi

export PATH MANPATH
