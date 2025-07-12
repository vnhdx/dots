#!/usr/bin/env bash

cwd=$(dirname "$(readlink -f "$0")")

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

source "${cwd}/_yay.sh"
source "${cwd}/../bin/_main.sh"

main "$@"
