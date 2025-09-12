# 11-sys.bash 
# created: 2025-09-11
# updated: 2025-09-11
#
# Configure system

# POSIX compliant check if command exists

# set EDITOR environment

# preference for neovim
if command -v nvim &> /dev/null; then
  EDITOR=$(command -v nvim) 
  alias vi=$(command -v nvim)
elif command -v vim &> /dev/null; then
  EDITOR=$(command -v vim) 
  alias vi=$(command -v vim)
elif command -v vi &> /dev/null; then
  EDITOR=$(command -v vi) 
fi

GIT_EDITOR=$EDITOR
export EDITOR GIT_EDITOR
