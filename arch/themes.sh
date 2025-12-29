#!/usr/bin/env bash

cwd=$(dirname "$(readlink -f "$0")")

pkgs=(
	#---------------------------------------------------------
	# Fonts
	#---------------------------------------------------------
	# woff2-font-awesome   # Iconic font designed for Bootstrap
	# noto-fonts           # Google Noto TTF fonts
	# noto-fonts-cjk       # Google Noto CJK fonts
	# noto-fonts-emoji     # Google Noto Color Emoji font
	# ttf-roboto           # Google's signature family of fonts
	# ttf-roboto-mono-nerd # Patched font Roboto Mono from nerd fonts library
	# ttf-fira-sans        # Mozilla's sans-serif typeface designed for Firefox OS

	inter-font        # A typeface specially designed for user interfaces
	ttf-firacode-nerd # Patched font Fira (Fura) Code from nerd fonts library
	# otf-firamono-nerd # Patched font Fira (Fura) Code from nerd fonts library

	#---------------------------------------------------------
	# Theme
	#---------------------------------------------------------
	qt5-wayland # Provides APIs for Wayland
	qt6-wayland # Provides APIs for Wayland
	qt5ct       # Qt5 Configuration Utility
	qt6ct       # Qt6 Configuration Utility
	nwg-look    # GTK settings editor adapted to work on wlroots-based compositors
	# kvantum
	# qgnomeplatform-qt5
	# qgnomeplatform-qt6
	# adwaita-qt5
	# adwaita-qt6
)

cfgs=(
	fontconfig
)

source "${cwd}/_main.sh"

main "$@"
