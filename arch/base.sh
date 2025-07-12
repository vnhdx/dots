#!/usr/bin/env bash

cwd=$(dirname "$(readlink -f "$0")")

pkgs=(
	wget
	curl
	fastfetch
	jq
	go-yq
	# busybox
	tealdeer # tldr

	# gnome-disk-utility

	fish # shell

	neovim

	gnome-keyring

	# Keyboard
	fcitx5
	fcitx5-unikey
	fcitx5-configtool

	# Network
	iw
	wireless-regdb

	# Firmware
	fwupd
	fwupd-efi

	# Snapshot
	snapper
	snap-pac
)

cfgs=(
	fish
	fcitx5
)

_install() {
	# Snapshot
	sudo snapper -c root create-config /
	sudo systemctl disable snapper-timeline.timer

	# Time
	# sudo timedatectl set-timezone Asia/Ho_Chi_Minh
	# sudo timedatectl set-local-rtc 0

	# Environment
	cat <<EOF >>~/.bashrc

# export QT_QPA_PLATFORMTHEME=qt6ct

export QT_STYLE_OVERRIDE=GTK+

export TERMINAL=footclient
export BROWSER=firefox
export EDITOR=nvim

# Bin
export PATH="\$HOME/.local/bin:\$PATH"
EOF
}

source "${cwd}/_yay.sh"
source "${cwd}/../bin/_main.sh"

main "$@"
