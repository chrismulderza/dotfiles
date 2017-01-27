
_debug "FILE: editor.bash"
# set editor

# prefer custom vim over system vi/vim
if [ -x /usr/local/bin/vim ]; then
  EDITOR=/usr/local/bin/vim
else
  EDITOR=/usr/bin/vim
fi
GIT_EDITOR=$EDITOR
export EDITOR GIT_EDITOR
