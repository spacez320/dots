# .xinitrc
#
# Configuration for xinit.

if [ -f $HOME/.Xmodmap ]; then
  xmodmap $HOME/.Xmodmap
fi

# auto starts
xscreensaver -no-splash &
