# .bashrc - workstation
# created: 2025-09-11
# updated: 2025-09-11

# If not running interactively, don't do anything
case $- in
  *i*) ;;
  *) return;;
esac

# User specific aliases and functions
if [ -d ~/.bashrc.d ]; then
	for rc in ~/.bashrc.d/*; do
		if [ -f "$rc" ]; then
			. "$rc"
		fi
	done
fi
unset rc

