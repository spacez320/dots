# .zprofile
#
# Configuration for login zsh.

### Sources

# profile
if [ -f $HOME/.env ]; then
  . $HOME/.env
fi
