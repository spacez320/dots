# .xinitrc
#
# Configuration for xinit.

if [ -f $HOME/.Xmodmap ]; then
  xmodmap $HOME/.Xmodmap
fi

# auto starts
if ! pgrep xscreensaver > /dev/null; then
  xscreensaver -no-splash &
fi

[[ -f $HOME/.Xresources ]] && xrdb -merge ~/.Xresources
