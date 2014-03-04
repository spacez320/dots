# .zprofile
#
# Configuration for login zsh.

### Sources

# shell profile
if [ -f ~/.shell_profile ]; then
  . ~/.shell_profile
fi

# profile
if [ -f ~/.profile ]; then
  . ~/.profile
fi
