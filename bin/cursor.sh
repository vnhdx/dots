#!/usr/bin/env bash

cwd=$(dirname "$(readlink -f "$0")")

version='1.4.2'

install() {
	source "${cwd}/_git.sh"

	url="https://downloads.cursor.com/production/07aa3b4519da4feab4761c58da3eeedd253a1671/linux/x64/Cursor-${version}-x86_64.AppImage"
	filename="$(download ${url})"
	chmod +x ${filename}

	mkdir -p ~/.local/bin/
	mv "${filename}" ~/.local/bin/enteauth
}

uninstall() {
	rm ~/.local/share/applications/cursor.desktop
	rm ~/.local/share/icons/co.anysphere.cursor.png
	rm ~/.local/bin/cursor
}

post_install() {
	source "${cwd}/_appimage.sh"

	create_desktop_entry \
		~/.local/bin/enteauth \
		cursor.desktop \
		co.anysphere.cursor.png

	sed -i \
		"s|^Exec=.*|Exec=$HOME/.local/bin/cursor|" \
		~/.local/share/applications/cursor.desktop
}

source "${cwd}/_main.sh"

main "$@"
