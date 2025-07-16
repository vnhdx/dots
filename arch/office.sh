#!/usr/bin/env bash

cwd=$(dirname "$(readlink -f "$0")")

pkgs=(
	# Message
	telegram-desktop # Official Telegram Desktop client

	# Email
	thunderbird # Standalone mail and news reader from mozilla.org
	# geary # A lightweight email client for the GNOME desktop
	# evolution # Manage your email, contacts and schedule

	# Docs
	libreoffice-fresh # LibreOffice branch which contains new features and program enhancements
	# libreoffice-still # LibreOffice maintenance branch
	# onlyoffice-bin # An office suite that combines text, spreadsheet and presentation editors
)

source "${cwd}/_yay.sh"
source "${cwd}/../bin/_main.sh"

main "$@"

# ${cwd}/../bin/onlyoffice.sh
