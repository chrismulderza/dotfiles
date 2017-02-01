_debug "FILE: bash_completion.bash"

# Source system wide completions
if [ -d /etc/bash_completion.d ]; then
  if test "$(/bin/ls -A "/etc/bash_completion.d")"; then 
    for file in /etc/bash_completion.d/*; do
      source $file
    done
  fi
fi

# Source Homebrew specific completions
if which brew &> /dev/null; then
  BREW_COMP_DIR=$(brew --prefix)/etc/bash_completion.d
  if [ -d ${BREW_COMP_DIR} ]; then
    if test "$(/bin/ls -A "${BREW_COMP_DIR}")"; then 
      for file in ${BREW_COMP_DIR}/*; do
        source $file
      done
    fi
  fi
fi

#Check personal completions
if [ -d ${HOME}/.bash_completion.d ]; then
  if test "$(/bin/ls -A "${HOME}/.bash_completion.d")"; then 
    for file in ${HOME}/.bash_completion.d/*; do
      source $file
    done
  fi
fi
