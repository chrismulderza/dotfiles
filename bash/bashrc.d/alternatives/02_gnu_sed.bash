# Use homebrew GNU coreutils if available (on osx)
_debug "FILE: 02_gnu_sed.bash"
PREFIX_DIR=/usr/local/opt/gnu-sed
if [ -d ${PREFIX_DIR} ]; then
  PATH=${PREFIX_DIR}/libexec/gnubin:$PATH
  MANPATH=${PREFIX_DIR}/libexec/gnuman:$MANPATH
fi

# Add gnu coreutils,findutils and other to the path
export PATH MANPATH
