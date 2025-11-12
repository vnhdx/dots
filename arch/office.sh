#!/usr/bin/env bash

cwd=$(dirname "$(readlink -f "$0")")

pkgs=(
	# Message
	telegram-desktop # Official Telegram Desktop client
	# pidgin
	# weechat
	# ferdium

	# Email
	thunderbird # Standalone mail and news reader from mozilla.org
	# geary # A lightweight email client for the GNOME desktop
	# evolution # Manage your email, contacts and schedule

	# Docs
	# libreoffice-fresh # LibreOffice branch which contains new features and program enhancements
	# libreoffice-still # LibreOffice maintenance branch
	onlyoffice-bin # An office suite that combines text, spreadsheet and presentation editors

	# Remote
	wayvnc
)

source "${cwd}/_main.sh"

main "$@"
