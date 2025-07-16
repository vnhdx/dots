#!/usr/bin/env bash

cwd=$(dirname "$(readlink -f "$0")")

pkgs=(
	neovim   # Fork of Vim aiming to improve user experience, plugins, and GUIs
	lazygit  # Simple terminal UI for git commands
	fzf      # Command-line fuzzy finder
	ripgrep  # A search tool that combines the usability of ag with the raw speed of grep
	fd       # Simple, fast and user-friendly alternative to find
	luarocks # Deployment and management system for Lua modules
)

cfgs=(
	nvim
)

source "${cwd}/_yay.sh"
source "${cwd}/../bin/_main.sh"

main "$@"
