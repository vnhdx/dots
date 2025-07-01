#!/usr/bin/env bash

pkgs=(
  neovim
  lazygit
  fzf
  ripgrep
  fd
  luarocks
)

. ./_pkg.sh

echo 'Setup lazyvim'
git clone git@github.com:vinh-d0/nvim-conf.git \
  ~/.config/nvim

cd ~/.config/nvim
git remote add upstream https://github.com/LazyVim/starter
