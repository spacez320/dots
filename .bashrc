# .bashrc
#
# Configuration for non-login bash.

### Sources

# global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# general rc import
if [ -f ~/.rc ]; then
  . ~/.rc
fi
