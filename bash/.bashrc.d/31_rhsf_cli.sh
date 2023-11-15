# Bash tools configuration         -*- shell-script -*-

# Add JBang to environment

if [ -d $HOME/opt/salesforce-automation ]; then
  export PATH="$HOME/opt/salesforce-automation:$PATH"
  alias rhsf="$HOME/opt/salesforce-automation/rhsf.py"
fi

# ex: ts=4 sw=4 et filetype=sh
