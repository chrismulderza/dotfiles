# Bash tools configuration         -*- shell-script -*-

# Add JBang to environment

if [ -d $HOME/opt/sfdx/bin ]; then
  export PATH="$HOME/opt/sfdx/bin:$PATH"
fi

# ex: ts=4 sw=4 et filetype=sh
