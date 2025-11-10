#!/usr/bin/env bash

cwd=$(dirname "$(readlink -f "$0")")

pkgs=(
	firefox   # Fast, Private & Safe Web Browser
	wget      # Network utility to retrieve files from the web
	curl      # command line tool and library for transferring data with URLs
	fastfetch # A feature-rich and performance oriented neofetch like system information tool
	less      # A terminal based program for viewing text files

	jq       # Command-line JSON processor
	tealdeer # A fast tldr client in Rust

	fish   # A package manager for the fish shell
	neovim # Fork of Vim aiming to improve user experience, plugins, and GUIs

	# Keyboard
	fcitx5            # Next generation of fcitx
	fcitx5-gtk        # Fcitx5 gtk im module and glib based dbus client library
	fcitx5-qt         # Fcitx5 Qt Library (Qt5 & Qt6 integrations)
	fcitx5-unikey     # Unikey engine support for Fcitx5
	fcitx5-configtool # Configuration Tool for Fcitx5

	# Wireless
	iw             # nl80211 based CLI configuration utility for wireless devices
	wireless-regdb # Central Regulatory Domain Database

	# Firmware
	fwupd     # Simple daemon to allow session software to update firmware
	fwupd-efi # EFI Application used by uefi-capsule plugin in fwupd

	# Snapshot
	snapper  # A tool for managing BTRFS and LVM snapshots
	snap-pac # Pacman hooks that use snapper to create pre/post btrfs snapshots like openSUSE's YaST
)

cfgs=(
	fish
	fcitx5
)

post_install() {
	# Snapshot
	sudo snapper -c root create-config /
	sudo systemctl disable snapper-timeline.timer

	# Time
	# sudo timedatectl set-timezone Asia/Ho_Chi_Minh
	# sudo timedatectl set-local-rtc 0

	# Environment
	cat <<EOF >>~/.bash_profile

# export QT_QPA_PLATFORMTHEME=qt6ct

export QT_STYLE_OVERRIDE=GTK+

export TERMINAL=footclient
export BROWSER=firefox
export EDITOR=nvim

# Bin
export PATH="\$HOME/.local/bin:\$PATH"
EOF
}

source "${cwd}/_main.sh"

main "$@"
