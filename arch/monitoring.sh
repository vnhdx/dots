#!/usr/bin/env bash

cwd=$(dirname "$(readlink -f "$0")")

pkgs=(
	htop # Interactive process viewer
	btop # A monitor of system resources, bpytop ported to C++
	# glances # CLI curses-based monitoring tool

	power-profiles-daemon # Makes power profiles handling available over D-Bus

	gdu      # Fast disk usage analyzer
	powertop # A tool to diagnose issues with power consumption and power management

	duf           # Disk Usage/Free Utility
	smartmontools # Control and monitor S.M.A.R.T. enabled ATA and SCSI Hard Drives
	dmidecode     # Desktop Management Interface table related utilities
	inxi          # Full featured CLI system information tool

	# Network
	speedtest-cli # Command line interface for testing internet bandwidth using speedtest.net
)

cfgs=(
	btop
	htop
)

source "${cwd}/_main.sh"

main "$@"
