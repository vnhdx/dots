#!/usr/bin/env bash

pkgs=(
	hyprland
	# xdg-desktop-portal-hyprland
	xdg-desktop-portal-gtk

	# Hypr Ecosystem
	# https://wiki.hypr.land/Hypr-Ecosystem/hyprsysteminfo/
	hyprpaper
	hyprpicker
	hypridle
	hyprlock
	# hyprpicker
	# hyprcursor
	hyprsunset
	# hyprpolkitagent
	# hyprcursor
	# hyprutils
	# hyprlang
	# aquamarine
	# hyprgraphics

	# Useful utilities
	# https://wiki.hypr.land/Useful-Utilities/
	foot
	waybar # gas eww
	dunst
	libnotify
	fuzzel

	# LCD Brightness, player
	brightnessctl
	playerctl

	# Screenshot
	grim
	wf-recorder
	slurp
	wl-clipboard
	hyprshot

	mpv
	imv

	# File namanger
	thunar
	thunar-volman
	thunar-archive-plugin
	xarchiver
	gvfs

	# Wireless
	# overskride
	# networkmanagerapplet

	# DM
	# uwsm
	greetd
	greetd-tuigreet
)

cfgs=(
	hypr
	foot
	fuzzel
	dunst
	waybar
	gtk-3.0
)

_install() {
	# Environment
	cat <<EOF >>~/.bashrc

# Hyprland
# export NIXOS_OZONE_WL=1
# export GTK_THEME='Adwaita:dark'
# export XCURSOR_THEME='Adwaita'
# export ICON_THEME='Adwaita'
EOF
}

source ./_yay.sh
source ../bin/_main.sh

main "$@"
