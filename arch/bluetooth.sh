#!/usr/bin/env bash

cwd=$(dirname "$(readlink -f "$0")")

pkgs=(
	bluez
	bluez-utils
	# blueman
)

cfgs=(
)

# post_install() {
# }

source "${cwd}/_main.sh"

main "$@"
