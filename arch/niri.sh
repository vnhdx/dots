#!/usr/bin/env bash

cwd=$(dirname "$(readlink -f "$0")")

pkgs=(
	niri

	fuzzel # an application launcher
	foot   # a terminal emulator wezterm, alacritty, kitty...
	dunst  # a notification daemon
	# org.freedesktop.secrets # for apps to rely on secrets portal
	swaybg   # a suggested Wayland wallpaper tool
	swaylock # a suggested Wayland screen locker
	swayidle # an idle management daemon for Wayland
	waybar   # a suggested Wayland customizable desktop bar
	# xwayland-satellite # for running X11 apps in XWayland
	xdg-desktop-portal-gtk # a suggested XDG desktop portal
	# xdg-desktop-portal-gnome # a XDG desktop portal required for screencasting

	libnotify
	brightnessctl
	# playerctl
	wf-recorder
	wl-clipboard

	mpv
	imv

	# File namanger
	thunar
	thunar-volman
	thunar-archive-plugin
	xarchiver
	gvfs

	# DM
	# greetd
	# greetd-tuigreet
	ly
)

cfgs=(
	niri
	foot
	fuzzel
	waybar
	swaylock
	dunst
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
}

# _uninstall() {
# }

source "${cwd}/_yay.sh"
source "${cwd}/../bin/_main.sh"

main "$@"
