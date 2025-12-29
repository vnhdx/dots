#!/usr/bin/env bash

cwd=$(dirname "$(readlink -f "$0")")

pkgs=(
	openbox   # Highly configurable and lightweight X11 window manager
	obconf-qt # Openbox configuration tool. Qt port of ObConf

	xrdp
	xorgxrdp
)

cfgs=(
	# environment.d
)

post_install() {
}

# post_uninstall() {
# }

source "${cwd}/_main.sh"

main "$@"
