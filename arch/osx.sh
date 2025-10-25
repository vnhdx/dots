#!/usr/bin/env bash

cwd=$(dirname "$(readlink -f "$0")")

pkgs=(
	qemu-base
	dmg2img
)

cfgs=(
)

source "${cwd}/_yay.sh"
source "${cwd}/../bin/_main.sh"

main "$@"
