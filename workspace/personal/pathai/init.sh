#!/bin/bash
#
# In case I ever need to rebuild.

brew cask install \
  adoptopenjdk \
  alacritty \
  aptible \
  minikube

brew tap \
  weaveworks/tap

brew install \
  argoproj/tap/argo \
  automake \
  black \
  cdrtools \
  cfssl \
  coreutils \
  dep \
  direnv \
  findutils \
  glide \
  go \
  gradle \
  jq \
  kubeless \
  kubernetes-cli \
  kubernetes-helm \
  libtool \
  libxmlsec1 \
  make \
  neofetch \
  npm \
  openssl \
  packer \
  pkg-config \
  postgresql \
  pyenv-virtualenv \
  python3 \
  shyaml \
  telnet \
  vault \
  watch \
  weaveworks/tap/eksctl \
  wget

sudo easy_install pip

pip install --user \
  awscli \
  flake8 \
  pgsanity \
  powerline-status \
  pytest \
  virtualenv
