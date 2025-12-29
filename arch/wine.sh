#!/usr/bin/env bash

cwd=$(dirname "$(readlink -f "$0")")

pkgs=(
	wine # A compatibility layer for running Windows programs

	lutris # Open Gaming Platform
	# bottles # Easily manage wine and proton prefix

	protonup-qt-bin # Install and manage Proton-GE for Steam and Wine-GE for Lutris with this graphical user interface.

	lib32-vulkan-icd-loader # Vulkan Installable Client Driver (ICD) Loader (32-bit)
	lib32-nvidia-utils      # NVIDIA drivers utilities (32-bit)
)

cfgs=(
)

# post_install() {
# }

source "${cwd}/_main.sh"

main "$@"
