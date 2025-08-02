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

# _install() {
# }

# _uninstall() {
# }

source "${cwd}/_yay.sh"
source "${cwd}/../bin/_main.sh"

main "$@"
