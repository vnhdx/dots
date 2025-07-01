#!/usr/bin/env bash

pkgs=(
  git
  lazygit
  bat
  make
  openssl
  protobuf

  # asdf
  # mise

  zed
  # code

  doublecmd
  bcompare
  # meld

  podman
  # helm
  # kubectl
  # k9s
)

exec ../bin/mise.sh

. ./_pkg.sh
