#!/usr/bin/env bash

pkgs=(
	noto-fonts
	noto-fonts-cjk

	ttf-firacode-nerd
	ttf-font-awesome
	ttf-opensans
)

source ./_yay.sh
source ../bin/_main.sh

main "$@"
