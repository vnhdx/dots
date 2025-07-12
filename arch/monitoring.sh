#!/usr/bin/env bash

cwd=$(dirname "$(readlink -f "$0")")

pkgs=(
	htop
	btop
	gdu
	powertop

	# glances
	duf
	smartmontools
	dmidecode
	inxi

	# Network
	speedtest-cli
)

cfgs=(
	btop
	htop
)

source "${cwd}/_yay.sh"
source "${cwd}/../bin/_main.sh"

main "$@"
