# .xinitrc
#
# Configuration for xinit.

if [ -f $HOME/.Xmodmap ]; then
  xmodmap $HOME/.Xmodmap
fi
