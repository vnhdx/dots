#!/usr/bin/env bash

cwd=$(dirname "$(readlink -f "$0")")

pkgs=(
	wayfire # 3D Wayland compositor, inspired by Compiz and based on wlroots
	# wf-shell # GTK3-based panel for the Wayfire compositor

	wlr-randr # Utility to manage outputs of a Wayland compositor
	fuzzel    # an application launcher
	foot      # a terminal emulator wezterm, alacritty, kitty...
	mako      # a suggested Wayland notification daemon
	# swaync #  A simple GTK based notification daemon for Sway

	# swaybg   # a suggested Wayland wallpaper tool
	swaylock # a suggested Wayland screen locker
	swayidle # an idle management daemon for Wayland

	# waybar                 # a suggested Wayland customizable desktop bar
	xdg-desktop-portal-wlr # xdg-desktop-portal backend for wlroots

	# xdg-desktop-portal-gnome # a XDG desktop portal required for screencasting
	# org.freedesktop.secrets # for apps to rely on secrets portal

	libnotify     # Library for sending desktop notifications
	brightnessctl # Lightweight brightness control tool
	slurp         # Select a region in a Wayland compositor
	grim          # Screenshot utility for Wayland
	wf-recorder   # Screen recorder for wlroots-based compositors such as sway
	wl-clipboard  # Command-line copy/paste utilities for Wayland

	mpv # cross-platform media player
	imv # Image viewer for Wayland and X11

	# File namanger
	nemo            # File manager for Cinnamon (Nautilus fork)
	nemo-fileroller # File archiver extension for Nemo
	file-roller     # Create and modify archives
	gvfs            # Virtual filesystem implementation for GIO

	ly # TUI display manager

	# X11 compositors
	# cage  # A kiosk compositor for Wayland
	# labwc # stacking wayland compositor with look and feel from openbox
)

cfgs=(
	foot
	fuzzel
	waybar
	swaylock
	mako
	gtk-3.0
)

# Display manager
_dm() {
	# # /etc/greetd/config.toml
	# command = "/usr/bin/tuigreet -r -c niri-session"

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
