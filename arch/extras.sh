#!/usr/bin/env bash

cwd=$(dirname "$(readlink -f "$0")")

pkgs=(
	# File manager
	doublecmd-qt6 # twin-panel (commander-style) file manager (Qt6)
	mc            # A file manager that emulates Norton Commander
	ranger        # Simple, vim-like file manager
	gnome-keyring # Stores passwords and encryption keys
	seahorse      # GNOME application for managing PGP keys
	bind          # A complete, highly portable implementation of the DNS protocol

	# busybox            # Utilities for rescue and embedded systems
	# gnome-disk-utility # Disk Management Utility for GNOME

	bind          # A complete, highly portable implementation of the DNS protocol
	nmap          # Utility for network discovery and security auditing
	speedtest-cli # Command line interface for testing internet bandwidth using speedtest.net

	easyeffects # Audio Effects for Pipewire applications
)

cfgs=(
	mc

)

source "${cwd}/_yay.sh"
source "${cwd}/../bin/_main.sh"
j
main "$@"
