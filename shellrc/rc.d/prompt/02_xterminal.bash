case ${TERM} in
  xterm*|rxvt*|Eterm|aterm|kterm|gnome*|interix|screen*)
    # If current terminal is an ssh session, prepend hostname to prompt
    remote_host() {
      if [ -n "$SSH_CONNECTION" ]; then
        echo "$(hostname):"
      fi
    }

    if [ -n "$BASH" ]; then
      #PROMPT_COMMAND='echo -ne "\033]0;$(hostname)\007"'
      TERM_HOST='echo -ne "\033]0;$(hostname)\007"'
    fi
  ;;
esac
