#!/usr/bin/env bash

cwd=$(dirname "$(readlink -f "$0")")

pkgs=(
	wayfire
	# wf-shell # GTK3-based panel for the Wayfire compositor

	wlr-randr # Utility to manage outputs of a Wayland compositor
	lswt      # List Wayland toplevels

	fuzzel                 # an application launcher
	foot                   # a terminal emulator wezterm, alacritty, kitty...
	mako                   # a suggested Wayland notification daemon
	swaybg                 # a suggested Wayland wallpaper tool
	swaylock               # a suggested Wayland screen locker
	swayidle               # an idle management daemon for Wayland
	waybar                 # a suggested Wayland customizable desktop bar
	xwayland-satellite     # for running X11 apps in XWayland
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
	thunar                # File manager for Xfce
	thunar-volman         # Management of removable drives and media for Thunar
	thunar-archive-plugin # Adds archive operations to the Thunar file context menus
	file-roller           # Create and modify archives
	gvfs                  # Virtual filesystem implementation for GIO

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

_wayfire() {
	# Environment
	cat <<EOF >>~/.bash_profile

# Wayland
export MOZ_ENABLE_WAYLAND=1
export MOZ_WAYLAND=1

export QT_QPA_PLATFORM=wayland
export ELECTRON_OZONE_PLATFORM_HINT=auto
export OZONE_PLATFORM_HINT=auto
# export DISPLAY=

# Theme
export GTK_THEME=Adwaita:dark
# XCURSOR_THEME=Adwaita
# ICON_THEME=Adwaita
export QT_QPA_PLATFORMTHEME=qt6ct
# QT_STYLE_OVERRIDE=GTK+

export TERMINAL=footclient
export BROWSER=firefox # firefox chromium
export EDITOR=nvim

# Fcitx
# GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS=@im=fcitx

# Bin
export PATH="$HOME/.local/bin:$PATH"

# Git
# GIT_CONFIG=$HOME/.config/git/config

# Go
# GOBIN="$HOME/.local/bin"

# Flutter
export PATH="$HOME/.pub-cache/bin:$PATH"
export CHROME_EXECUTABLE=/usr/bin/firefox
EOF

}

# Display manager
_dm() {
	# # /etc/greetd/config.toml
	# command = "/usr/bin/tuigreet -r -c niri-session"

	sudo systemctl enable ly.service
	sudo systemctl disable getty@tty2.service
}

post_install() {
	_wayfire
	_dm
}

# post_uninstall() {
# }

source "${cwd}/_main.sh"

main "$@"
