# .zshrc
#
# Configuration for non-login zsh.

### Sources

# global definitions
if [ -f /etc/zshrc ]; then
  . /etc/zshrc
fi

# oh-my-zsh
if [ -f ~/.oh-my-zsh ]; then
  . ~/.oh-my-zsh
fi

# general rc import
if [ -f ~/.rc ]; then
  . ~/.rc
fi
