_debug "FILE: bash_completion.bash"

# Source system wide completions
_debug "System wide completions"
if [ -d /etc/bash_completion.d ]; then
  if test "$(/bin/ls -A "/etc/bash_completion.d")"; then 
    for file in /etc/bash_completion.d/*; do
      source $file
    done
  fi
fi

# Source Homebrew specific completions
_debug "Homebrew completions"
if which brew &> /dev/null; then
  if [ -f $(brew --prefix)/etc/bash_completion ]; then
    source $(brew --prefix)/etc/bash_completion
  fi
fi

#Check personal completions
_debug "Personal completions"
if [ -d ${HOME}/.bash_completion.d ]; then
  if test "$(/bin/ls -A "${HOME}/.bash_completion.d")"; then 
    for file in ${HOME}/.bash_completion.d/*; do
      _debug "FILE: ${file}"
      source $file
    done
  fi
fi
