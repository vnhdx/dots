#!/usr/bin/env bash

cwd=$(dirname "$(readlink -f "$0")")

pkgs=(
	niri

	fuzzel # a suggested Wayland application launcher
	foot   # a terminal emulator wezterm, alacritty, kitty...
	mako   # a suggested Wayland notification daemon
	# org.freedesktop.secrets # for apps to rely on secrets portal
	swaybg   # a suggested Wayland wallpaper tool
	swaylock # a suggested Wayland screen locker
	swayidle # an idle management daemon for Wayland
	waybar   # a suggested Wayland customizable desktop bar
	# xwayland-satellite # for running X11 apps in XWayland
	xdg-desktop-portal-gtk # a suggested XDG desktop portal
	# xdg-desktop-portal-gnome # a XDG desktop portal required for screencasting

	brightnessctl
	# playerctl
	grim
	wf-recorder
	slurp
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
	greetd
	greetd-tuigreet
)

cfgs=(
	niri
	waybar
	gtk-3.0
)

_greetd() {
	cat <<EOF | sudo tee /etc/greetd/config.toml
# The VT to run the greeter on. Can be "next", "current" or a number
# designating the VT.
vt = 1

# The default session, also known as the greeter.
[default_session]

# $(agreety) is the bundled agetty/login-lookalike. You can replace $(/bin/sh)
# with whatever you want started, such as $(sway).
# command = "agreety --cmd /bin/sh"
# command = "/usr/bin/tuigreet -r -c niri-session"
command = "niri-session"

# The user to run the command as. The privileges this user must have depends
# on the greeter. A graphical greeter may for example require the user to be
# in the $(video) group.
user = "$USER"
EOF
}

# https://github.com/YaLTeR/niri/wiki/Example-systemd-Setup
_systemd() {

}

_install() {
	ln -sf ~/.config/waybar/wm/niri.jsonc ~/.config/waybar/config.jsonc

	systemctl --user add-wants niri.service \
		~/.config/niri/systemd/swaybg.service \
		~/.config/niri/systemd/swaybg.service

	systemctl --user daemon-reload
}

# _uninstall() {
# }

source "${cwd}/_yay.sh"
source "${cwd}/../bin/_main.sh"

main "$@"
