#!/bin/env sh

install() {
  echo '==> Install neovim & depend packages'
  yay -S --noconfirm \
    neovim \
    lazygit \
    ripgrep \
    fzd \
    luarocks
}

setup() {
  echo '==> Setup lazyvim'
  git clone git@github.com:thanh-vinh/nvim-conf.git \
    ~/.config/nvim

  cd ~/.config/nvim
  git remote add upstream https://github.com/LazyVim/starter
}

install
setup
