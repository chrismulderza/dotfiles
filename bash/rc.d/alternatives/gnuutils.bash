
# Use homebrew GNU coreutils if available (on osx)
_debug "FILE: gnuutils.bash"
if which brew &> /dev/null; then 
  if [ -d $(brew --prefix coreutils)/libexec/gnubin ]; then
    PATH=$(brew --prefix coreutils)/libexec/gnubin:$PATH
    MANPATH=$(brew --prefix coreutils)/libexec/gnuman:$MANPATH
    MANPATH=$(brew --prefix gnu-sed)/libexec/gnuman:$MANPATH
  fi
  if [ -d $(brew --prefix coreutils)/libexec/gnuman ]; then
    MANPATH=$(brew --prefix coreutils)/libexec/gnuman:$MANPATH
    MANPATH=$(brew --prefix gnu-sed)/libexec/gnuman:$MANPATH
  fi
fi

# Add gnu coreutils,findutils and other to the path

export PATH MANPATH

