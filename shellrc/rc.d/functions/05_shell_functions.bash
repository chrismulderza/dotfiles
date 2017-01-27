# shell version of ord() and chr()
ord() { printf "0x%x\n" "'$1"; }
chr() { printf $(printf '\\%03o\\n' "$1"); }

# highlight text
highlight() { e="$1"; shift; grep --color=always -Eih "$e|$" "$@"; }

# grep process table
psgrep() { psc |grep -v grep |grep -i --color=auto "$@"; }

pspid() { ps xao pid,args |grep -v grep |grep -i "$@" |awk '{print $1}'; }

# killall alternative
pskill() {
  # Check whether a signal was given
  if [[ "$1" =~ '^-[[:alnum:]]+' ]]; then
    SIGNAL=$1
    shift
  else
    SIGNAL="-TERM"
  fi

  PIDS=$(pspid $@)
  if [ -n "$PIDS" ]; then
    echo $PIDS |xargs kill $SIGNAL
  else
    echo "No processes matching '$@' found" 1>&2
  fi
}

# recursively traverse directory tree for git repositories, run git command
# e.g.
#   gittree status
#   gittree diff
gittree() {
  if [ $# -lt 1 ]; then
    echo "Usage: gittree <command>"
    return 1
  fi

  for gitdir in $(find . -type d -name .git); do
    # Display repository name in blue
    repo=$(dirname $gitdir)
    echo -e "\033[34m$repo\033[0m"

    # Run git command in the repositories directory
    cd $repo && git $@
    ret=$?

    # Return to calling directory (ignore output)
    cd - > /dev/null

    # Abort if cd or git command fails
    if [ $ret -ne 0 ]; then
      return 1
    fi

    echo
  done
}

# Serve current directory with Python's simple HTTP server
serve() {
  local port=${1:-8000}
  python -m SimpleHTTPServer ${port}
}

#
# URL encoding and decoding functions
# Borrowed from https://github.com/Daenyth/dotfiles/blob/master/.bashrc
#

urlencode() {
  local LANG=C
  arg="$1"
  i="0"
  while [ "$i" -lt ${#arg} ]; do
    c=${arg:$i:1}
    if echo "$c" | grep -q '[a-zA-Z/:_\.\-]'; then
      echo -n "$c"
    else
      echo -n "%"
      printf "%X" "'$c'"
    fi
    i=$((i+1))
  done
}

urldecode() {
  local LANG=C
  arg="$1"
  i="0"
  while [ "$i" -lt ${#arg} ]; do
    c0=${arg:$i:1}
    if [ "x$c0" = "x%" ]; then
      c1=${arg:$((i+1)):1}
      c2=${arg:$((i+2)):1}
      printf "\x$c1$c2"
      i=$((i+3))
    else
      echo -n "$c0"
      i=$((i+1))
    fi
  done
}

