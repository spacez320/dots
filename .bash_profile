# .bash_profile
#
# Configuration for login bash.

### Sources

# rc
if [ -f $HOME/.bashrc ]; then
  . $HOME/.bashrc
fi

# profile
if [ -f $HOME/.env ]; then
  . $HOME/.env
fi
