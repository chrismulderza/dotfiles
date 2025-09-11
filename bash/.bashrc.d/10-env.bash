# 10-env.bash 
# created: 2025-09-11
# updated: 2025-09-11
#
# Configure environment

# PATH 
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]
then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

