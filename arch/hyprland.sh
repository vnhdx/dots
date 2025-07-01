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
  rofi-wayland

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

  # superfile
  # xarchiver

  # Wireless
  # overskride
  # networkmanagerapplet

  # DM
  # uwsm
  greetd-tuigreet
)

setup() {
  cfgs=(
    foot
    gtk-3.0
    hypr
    rofi
    waybar
  )

  for cfg in "${cfgs[@]}"
  do
    cp -r "../.config/${cfg}" ~/.config/
  done
}

env(){
  cat <<EOF >> ~/.bashrc

# Hyprland
# export NIXOS_OZONE_WL=1
# export GTK_THEME='Adwaita:dark'
# export XCURSOR_THEME='Adwaita'
# export ICON_THEME='Adwaita'
EOF
}

. ./_pkg.sh

setup
env
