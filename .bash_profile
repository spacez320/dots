# .bash_profile
#
# Configuration for login bash.

### Sources

# bashrc
if [ -f ~/.bashrc ]; then
  . ~/.bashrc
fi

# shell profile
if [ -f ~/.shell_profile ]; then
  . ~/.shell_profile
fi

# profile
if [ -f ~/.profile ]; then
  . ~/.profile
fi
