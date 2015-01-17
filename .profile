# .profile
#
# Shell agnostic login configuration.

# env
export PYTHONSTARTUP="$HOME/.pythonrc"
export EDITOR=/usr/bin/vim
export PS1="\[\033[01;32m\]\u@\h\[\033[01;34m\] \W \$\[\033[00m\] "
export PATH="$PATH:$HOME/bin:$HOME/.local/bin:$HOME/lib/p:/usr/local/heroku/bin"
export TZ="America/New_York"
export POWERLINE="$HOME/.local/lib/python2.7/site-packages/powerline/bindings"
export HISTIGNORE=' *'
export HOME_PRIV="$HOME/mnt/deontos"
export GNUPGHOME="$HOME_PRIV/.gnupg"
unset PAGER
unset RUBYOPT

### Source

for f in $HOME/.profile.d/*; do [ -r $f ] && . $f; done
