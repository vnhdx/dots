#!/usr/bin/env bash

cwd=$(dirname "$(readlink -f "$0")")

pkgs=(
	mc # A file manager that emulates Norton Commander
)

cfgs=(
	mc
)

source "${cwd}/_yay.sh"
source "${cwd}/../bin/_main.sh"

main "$@"
