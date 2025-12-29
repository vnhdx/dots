#!/usr/bin/env bash

cwd=$(dirname "$(readlink -f "$0")")

pkgs=(
	cosmic-session # Session manager for the COSMIC desktop environment

	foot         # a terminal emulator wezterm, alacritty, kitty...
	wl-clipboard # Command-line copy/paste utilities for Wayland

	mpv # cross-platform media player
	imv # Image viewer for Wayland and X11

	# File namanger
	file-roller # Create and modify archives
	# gvfs        # Virtual filesystem implementation for GIO

	ly # TUI display manager
)

cfgs=(
	foot
	cosmic
	environment.d
)

# Display manager
_dm() {
	sudo systemctl enable ly.service
	sudo systemctl disable getty@tty2.service
}

post_install() {
	_dm
}

# post_uninstall() {
# }

source "${cwd}/_main.sh"

main "$@"
