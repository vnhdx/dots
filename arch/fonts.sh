#!/usr/bin/env bash

cwd=$(dirname "$(readlink -f "$0")")

pkgs=(
	ttf-font-awesome

	# Noto
	noto-fonts
	# noto-fonts-cjk
	# noto-fonts-emoji
	# ttf-noto-nerd

	# Inter
	inter-font

	# Roboto
	# ttf-roboto
	# ttf-roboto-mono-nerd

	# Fira
	# ttf-fira-sans
	ttf-firacode-nerd
)

source "${cwd}/_yay.sh"
source "${cwd}/../bin/_main.sh"

main "$@"
