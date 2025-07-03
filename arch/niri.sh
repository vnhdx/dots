#!/usr/bin/env bash

cwd=$(dirname "$(readlink -f "$0")")

pkgs=(
  niri

  fuzzel # a suggested Wayland application launcher
  foot # a terminal emulator wezterm, alacritty, kitty...
  mako # a suggested Wayland notification daemon
  # org.freedesktop.secrets # for apps to rely on secrets portal
  swaybg # a suggested Wayland wallpaper tool
  swaylock # a suggested Wayland screen locker
  waybar # a suggested Wayland customizable desktop bar
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

_install() {
	ln -sf ~/.config/waybar/wm/niri.jsonc ~/.config/waybar/config.jsonc
}

# _uninstall() {
# }

source "${cwd}/_yay.sh"
source "${cwd}/../bin/_main.sh"

main "$@"
