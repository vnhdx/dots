#!/usr/bin/env bash

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

source ./_yay.sh
source ../bin/_main.sh

main "$@"
