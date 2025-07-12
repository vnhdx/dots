#!/usr/bin/env bash

cwd=$(dirname "$(readlink -f "$0")")

pkgs=(
	river
	xdg-desktop-portal-gtk
)

cfgs=(
	river
)

_install() {
	# Wayland sessions
	mkdir -p ~/.local/share/wayland-sessions
	cat <<EOF >~/.local/share/wayland-sessions/river.desktop
  [Desktop Entry]
  Name=River
  Comment=A dynamic tiling Wayland compositor
  Exec=river
  Type=Application
  DesktopNames=river
  Keywords=wayland;wm;tiling;
  Categories=System;
  Icon=river
  StartupNotify=false
EOF
}

_uninstall() {
	rm ~/.local/share/wayland-sessions/river.desktop
}

source "${cwd}/_yay.sh"
source "${cwd}/../bin/_main.sh"

main "$@"
