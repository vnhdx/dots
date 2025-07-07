#!/usr/bin/env bash

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

source ./_yay.sh
source ../bin/_main.sh

main "$@"
