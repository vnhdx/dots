#!/usr/bin/env bash

cwd=$(dirname "$(readlink -f "$0")")

pkgs=(
	# woff2-font-awesome # Iconic font designed for Bootstrap

	noto-fonts # Google Noto TTF fonts
	# noto-fonts-cjk   # Google Noto CJK fonts
	# noto-fonts-emoji # Google Noto Color Emoji font

	inter-font # A typeface specially designed for user interfaces

	# ttf-roboto           # Google's signature family of fonts
	# ttf-roboto-mono-nerd # Patched font Roboto Mono from nerd fonts library

	# ttf-fira-sans   # Mozilla's sans-serif typeface designed for Firefox OS
	ttf-firacode-nerd # Patched font Fira (Fura) Code from nerd fonts library
)

source "${cwd}/_yay.sh"
source "${cwd}/../bin/_main.sh"

main "$@"
