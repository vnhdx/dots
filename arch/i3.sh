#!/usr/bin/env bash

cwd=$(dirname "$(readlink -f "$0")")

pkgs=(
	xorg-server
	xorg-server-common
	xorg-xauth
	xorg-xinput

	i3-wm
)

cfgs=(
	# gtk-3.0
)

# Display manager
_dm() {
	sudo systemctl enable ly.service
	sudo systemctl disable getty@tty2.service
}

post_install() {
}

# post_uninstall() {
# }

source "${cwd}/_main.sh"

main "$@"
