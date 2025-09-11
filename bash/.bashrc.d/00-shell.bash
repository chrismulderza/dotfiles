# 00-shell.bash 
# created: 2025-09-11
# updated: 2025-09-11
#
# Configure basic bash shell bahaviour

#### History

# ignore lines starting with a whitespace, as well as duplicates
HISTCONTROL=ignoredups:ignorespace 

# append to the history file, don't overwrite it
shopt -s histappend
# remember up to 100.000 entries
HISTSIZE=100000                    
# store as many entries in file as in memory
HISTFILESIZE=$HISTSIZE             
# share history file with zsh
HISTFILE=$HOME/.history
export HISTSIZE HISTFILESIZE HISTFILE HISTCONTROL

#### Window/application

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

#### Locale

LC_ALL=en_US.utf-8
LANG="${LC_ALL}"
export LC_ALL
export LANG
