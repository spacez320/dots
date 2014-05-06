# .profile
#
# Shell agnostic login configuration.

# env
export PYTHONSTARTUP="$HOME/.pythonrc"
export EDITOR=/usr/bin/vim
export PS1="\[\033[01;32m\]\u@\h\[\033[01;34m\] \W \$\[\033[00m\] "
export PATH="$PATH:$HOME/bin:$HOME/.local/bin:$HOME/lib/p:/usr/local/heroku/bin"
export TZ="America/New_York"
export AWESOME_SHELL="urxvt256c-ml"
export POWERLINE="/usr/lib/python2.7/site-packages/powerline/bindings"
export HISTIGNORE=' *'
export HOME_PRIV="$HOME/mnt/deontos"
unset PAGER
unset RUBYOPT

# keychain
if [ $(command -v keychain) ] && [ $SSH_KEYS ]; then
  for key in $(eval echo $SSH_KEY); do
    keychain ~/.ssh/"${key}" --quiet
    . ~/.keychain/"$HOSTNAME"-sh
    . ~/.keychain/"$HOSTNAME"-sh-gpg
  done
fi

### Source

[[ -n `find $HOME/.shell.d/ -not -name '.*'` ]] && . $HOME/.shell.d/*
