#!/usr/bin/env bash

# Load RVM, if you are using it
[[ -s $HOME/.rvm/scripts/rvm ]] && source $HOME/.rvm/scripts/rvm

# Add rvm gems and nginx to the path
#export PATH=$PATH:~/.gem/ruby/1.8/bin:/opt/nginx/sbin

# Path to the bash it configuration
export BASH_IT=$HOME/.bash_it

# Lock and Load a custom theme file
# location /.bash_it/themes/
export BASH_IT_THEME='modern'

# Your place for hosting Git repos. I use this for private repos.
#export GIT_HOSTING='git@git.domain.com'

# Set my editor and git editor
export EDITOR="/usr/bin/vim"
export GIT_EDITOR='/usr/bin/vim'

# Set the path nginx
export NGINX_PATH='/opt/nginx'

# Don't check mail when opening terminal.
unset MAILCHECK

# OSX Specific, replace GNU tools
#export PATH=$(brew --prefix coreutils)/libexec/gnubin:$PATH
#export MANPATH=$(brew --prefix coreutils)/libexec/gnuman:$MANPATH

# Change this to your console based IRC client of choice.

export IRC_CLIENT='irssi'

# Set this to the command you use for todo.txt-cli

export TODO="t"

# Set vcprompt executable path for scm advance info in prompt (demula theme)
# https://github.com/xvzf/vcprompt
#export VCPROMPT_EXECUTABLE=~/.vcprompt/bin/vcprompt

############## EDCON SOA ENVIRONMENT ####################

#/TODO: Split these out to a modularised section
#
# Oracle SOA
#
EDCON_CODE_BASE=${HOME}/Projects/Edcon/src
LOCAL_MDS_ROOT=${EDCON_CODE_BASE}/middleware
export LOCAL_MDS_ROOT

#
# JDEV
#
JDEV_USER_DIR=/Users/cmulder/Projects/Edcon/config/jdev117
JDEV_HOME=/Users/cmulder/Oracle/Middleware/jdeveloper
MY_JDEV_OPTIONS="-J-Dlocal.mds.root=$LOCAL_MDS_ROOT -J-Dfile.encoding=UTF-8"
JDEV_TMP_DIR=/tmp
ANT_HOME=/Users/cmulder/Oracle/Middleware/modules/org.apache.ant_1.7.1
JAVA_HOME=$(/usr/libexec/java_home)


export JDEV_USER_DIR JDEV_HOME MY_JDEV_OPTIONS JDEV_TMP_DIR ANT_HOME JAVA_HOME

#
# TOOLBOX_ORA_FMW_UTIL
#
TOOLBOX_HOME=/opt/frameworks/toolbox
TOOLBOX_CXF_HOME=/opt/frameworks/apache-cxf-2.7.11
TOOLBOX_ORA_FMW_UTIL_HOME=/opt/frameworks/tbmodules/toolbox_oracle_fmw_util
ORACLE_MW_HOME=/Users/cmulder/Oracle/Middleware
OSB_HOME=$ORACLE_MW_HOME/osb_11.1.1.7

PATH=$TOOLBOX_ORA_FMW_UTIL_HOME/bin:$ANT_HOME/bin:$PATH

export TOOLBOX_HOME TOOLBOX_CXF_HOME TOOLBOX_ORA_FMW_UTIL_HOME ORACLE_MW_HOME OSB_HOME PATH






# Load Bash It
source $BASH_IT/bash_it.sh
