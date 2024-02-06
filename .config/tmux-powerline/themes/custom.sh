#
# Theme for tmux-powerline.

black="#000507"
blue="#023550"
cyan="#02899e"
green="#93d0cb"
magenta="#023550"
red="#d9483b"
white="#a0cecb"
yellow="#f2c12e"


TMUX_POWERLINE_SEPARATOR_LEFT_BOLD=""
TMUX_POWERLINE_SEPARATOR_LEFT_THIN=""
TMUX_POWERLINE_SEPARATOR_RIGHT_BOLD=""
TMUX_POWERLINE_SEPARATOR_RIGHT_THIN=""

TMUX_POWERLINE_DEFAULT_BACKGROUND_COLOR=${TMUX_POWERLINE_DEFAULT_BACKGROUND_COLOR:-$black}
TMUX_POWERLINE_DEFAULT_FOREGROUND_COLOR=${TMUX_POWERLINE_DEFAULT_FOREGROUND_COLOR:-$white}
TMUX_POWERLINE_DEFAULT_LEFTSIDE_SEPARATOR=${TMUX_POWERLINE_DEFAULT_LEFTSIDE_SEPARATOR:-$TMUX_POWERLINE_SEPARATOR_RIGHT_BOLD}
TMUX_POWERLINE_DEFAULT_RIGHTSIDE_SEPARATOR=${TMUX_POWERLINE_DEFAULT_RIGHTSIDE_SEPARATOR:-$TMUX_POWERLINE_SEPARATOR_LEFT_BOLD}

if [ -z $TMUX_POWERLINE_WINDOW_STATUS_CURRENT ]; then
  TMUX_POWERLINE_WINDOW_STATUS_CURRENT=(
    "#[$(format inverse)]" \
    "$TMUX_POWERLINE_DEFAULT_LEFTSIDE_SEPARATOR" \
    " #I#F " \
    "$TMUX_POWERLINE_SEPARATOR_RIGHT_THIN" \
    " #W " \
    "#[$(format regular)]" \
    "$TMUX_POWERLINE_DEFAULT_LEFTSIDE_SEPARATOR"
  )
fi

if [ -z $TMUX_POWERLINE_WINDOW_STATUS_STYLE ]; then
  TMUX_POWERLINE_WINDOW_STATUS_STYLE=(
    "$(format regular)"
  )
fi

if [ -z $TMUX_POWERLINE_WINDOW_STATUS_FORMAT ]; then
  TMUX_POWERLINE_WINDOW_STATUS_FORMAT=(
    "#[$(format regular)]" \
    "  #I#{?window_flags,#F, } " \
    "$TMUX_POWERLINE_SEPARATOR_RIGHT_THIN" \
    " #W "
  )
fi

TMUX_POWERLINE_LEFT_STATUS_SEGMENTS=(
  "tmux_session_info $white $black" \
  "hostname $cyan $black" \
  "lan_ip $blue $white" \
  "wan_ip $black $cyan" \
  "vcs_branch $white $black" \
)

TMUX_POWERLINE_RIGHT_STATUS_SEGMENTS=(
  "pwd $white $black" \
  "now_playing $black $cyan" \
  "load $blue $white" \
  "battery $cyan $black" \
  "date_day $white $black" \
  "date $white $black ${TMUX_POWERLINE_SEPARATOR_LEFT_THIN}" \
  "time $white $black ${TMUX_POWERLINE_SEPARATOR_LEFT_THIN}" \
)
