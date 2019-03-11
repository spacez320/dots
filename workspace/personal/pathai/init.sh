#!/bin/bash
#
# In case I ever need to rebuild.

brew cask install \
  aptible

brew install \
  argoproj/tap/argo \
  automake \
  coreutils \
  dep \
  direnv \
  findutils \
  go \
  jq \
  kubeless \
  kubernetes-cli \
  kubernetes-helm \
  libtool \
  libxmlsec1 \
  make \
  npm \
  packer \
  pkg-config \
  postgresql \
  pyenv-virtualenv \
  python3 \
  shyaml \
  telnet \
  vault \
  watch \
  wget

sudo easy_install pip

pip install --user \
  awscli \
  flake8 \
  pgsanity \
  pytest \
  virtualenv
