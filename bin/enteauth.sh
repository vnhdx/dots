#!/usr/bin/env bash

cwd=$(dirname "$(readlink -f "$0")")

install() {
	source "${cwd}/_git.sh"

	url=$(find_github_latest_release 'ente-io/ente' 'x86_64.AppImage')
	filename="$(download ${url})"
	chmod +x ${filename}

	mkdir -p ~/.local/bin/
	mv "${filename}" ~/.local/bin/enteauth
}

uninstall() {
	rm ~/.local/share/applications/enteauth.desktop
	rm ~/.local/share/icons/enteauth.png
	rm ~/.local/bin/enteauth
}

post_install() {
	source "${cwd}/_appimage.sh"

	create_desktop_entry \
		~/.local/bin/enteauth \
		enteauth.desktop \
		enteauth.png

	# sed -i \
	# 	's|^Exec=.*|Exec=~/.local/bin/enteauth|' \
	# 	~/.local/share/applications/enteauth.desktop
}

source "${cwd}/_main.sh"

main "$@"
