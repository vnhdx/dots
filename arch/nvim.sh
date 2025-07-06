#!/usr/bin/env bash

pkgs=(
  neovim
  # lazygit
  fzf
  ripgrep
  fd
  luarocks
)

cfgs=(
	nvim
)

source ./_yay.sh
source ../bin/_main.sh

main "$@"
