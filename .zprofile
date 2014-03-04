# .zprofile
#
# Configuration for login zsh.

### Sources

# zshrc
if [ -f ~/.zshrc ]; then
  . ~/.zshrc
fi

# shell profile
if [ -f ~/.shell_profile ]; then
  . ~/.shell_profile
fi

# profile
if [ -f ~/.profile ]; then
  . ~/.profile
fi
