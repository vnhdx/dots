#!/usr/bin/env bash

pkgs=(
  wget
  curl
  jq
  go-yq
  # busybox

  htop
  btop
  gdu
  gnome-disk-utility
  powertop

  fish # shell

  neovim

  gnome-keyring

  # Keyboard
  fcitx5
  fcitx5-unikey
  fcitx5-configtool
)

setup() {
  cfgs=(
    fish
    fcitx5
  )
  for cfg in "${cfgs[@]}"; do
    cp -r "../config/${cfg}/" ~/.config/
  done
}

env() {
  cat <<EOF >> ~/.bashrc

# export QT_QPA_PLATFORMTHEME=qt6ct

export QT_STYLE_OVERRIDE=GTK+

export TERMINAL=footclient
export BROWSER=firefox
export EDITOR=nvim

# Bin
export PATH="\$HOME/.local/bin:\$PATH"
EOF
}

. ./_pkg.sh

setup
env
