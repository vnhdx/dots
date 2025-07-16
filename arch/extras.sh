#!/usr/bin/env bash

cwd=$(dirname "$(readlink -f "$0")")

pkgs=(
	# File manager
	doublecmd-qt6 # twin-panel (commander-style) file manager (Qt6)
	mc            # A file manager that emulates Norton Commander
	ranger        # Simple, vim-like file manager

	# gnome-disk-utility # Disk Management Utility for GNOME

	gnome-keyring # Stores passwords and encryption keys
	seahorse      # GNOME application for managing PGP keys

	# busybox  # Utilities for rescue and embedded systems
)

cfgs=(
	mc

)

source "${cwd}/_yay.sh"
source "${cwd}/../bin/_main.sh"
j
main "$@"
