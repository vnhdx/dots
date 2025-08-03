#!/usr/bin/env bash

cwd=$(dirname "$(readlink -f "$0")")

pkgs=(
	niri

	fuzzel                 # an application launcher
	foot                   # a terminal emulator wezterm, alacritty, kitty...
	mako                   # a suggested Wayland notification daemon
	swaybg                 # a suggested Wayland wallpaper tool
	swaylock               # a suggested Wayland screen locker
	swayidle               # an idle management daemon for Wayland
	waybar                 # a suggested Wayland customizable desktop bar
	xwayland-satellite     # for running X11 apps in XWayland
	xdg-desktop-portal-gtk # a suggested XDG desktop portal

	# xdg-desktop-portal-gnome # a XDG desktop portal required for screencasting
	# org.freedesktop.secrets # for apps to rely on secrets portal

	libnotify     # Library for sending desktop notifications
	brightnessctl # Lightweight brightness control tool
	slurp         # Select a region in a Wayland compositor
	wf-recorder   # Screen recorder for wlroots-based compositors such as sway
	wl-clipboard  # Command-line copy/paste utilities for Wayland

	mpv # cross-platform media player
	imv # Image viewer for Wayland and X11

	# File namanger
	thunar                # File manager for Xfce
	thunar-volman         # Management of removable drives and media for Thunar
	thunar-archive-plugin # Adds archive operations to the Thunar file context menus
	xarchiver             # GTK+ frontend to various command line archivers
	gvfs                  # Virtual filesystem implementation for GIO

	ly # TUI display manager

	# X11 compositors
	# cage  # A kiosk compositor for Wayland
	# labwc # stacking wayland compositor with look and feel from openbox
)

cfgs=(
	niri
	foot
	fuzzel
	waybar
	swaylock
	mako
	gtk-3.0
)

# Niri session with systemd
# https://github.com/YaLTeR/niri/wiki/Example-systemd-Setup
_niri() {
	ln -sf ~/.config/waybar/wm/niri.jsonc ~/.config/waybar/config.jsonc

	systemctl --user add-wants niri.service \
		~/.config/niri/systemd/swaybg.service \
		~/.config/niri/systemd/swaybg.service

	systemctl --user daemon-reload
}

# Display manager
_dm() {
	# # /etc/greetd/config.toml
	# command = "/usr/bin/tuigreet -r -c niri-session"

	sudo systemctl enable ly.service
	sudo systemctl disable getty@tty2.service
}

_install() {
	_niri
	_dm
}

# _uninstall() {
# }

source "${cwd}/_yay.sh"
source "${cwd}/../bin/_main.sh"

main "$@"
