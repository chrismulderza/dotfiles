# Bash tools configuration         -*- shell-script -*-

# Add JBang to environment

if [ -d $HOME/.jbang/bin ]; then
  alias j!=jbang
  export PATH="$HOME/.jbang/bin:$PATH"
fi

# ex: ts=4 sw=4 et filetype=sh
