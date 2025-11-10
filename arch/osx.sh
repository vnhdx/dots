#!/usr/bin/env bash

cwd=$(dirname "$(readlink -f "$0")")

pkgs=(
	qemu-base
	dmg2img
)

cfgs=(
)

source "${cwd}/_main.sh"

main "$@"
