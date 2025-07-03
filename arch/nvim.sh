#!/usr/bin/env bash

pkgs=(
  neovim
  # lazygit
  fzf
  ripgrep
  fd
  luarocks
)

_install() {
  echo 'Setup lazyvim'
  git clone git@github.com:vnhdx/nvim-conf.git \
    ~/.config/nvim

  cd ~/.config/nvim
  git remote add upstream https://github.com/LazyVim/starter
}

source ./_yay.sh
source ../bin/_main.sh

main "$@"
