#!/usr/bin/env bash

cwd=$(dirname "$(readlink -f "$0")")

install() {
	wget -O /tmp/onlyoffice https://download.onlyoffice.com/install/desktop/editors/linux/DesktopEditors-x86_64.AppImage
	chmod a+x /tmp/onlyoffice

	mkdir -p ~/.local/bin
	mv /tmp/onlyoffice ~/.local/bin/
}

uninstall() {
	rm ~/.local/share/applications/onlyoffice-desktopeditors.desktop
	rm ~/.local/share/icons/onlyoffice-desktopeditors.png
	rm ~/.local/bin/onlyoffice
}

post_install() {
	source "${cwd}/_appimage.sh"

	create_desktop_entry \
		~/.local/bin/onlyoffice \
		onlyoffice-desktopeditors.desktop \
		onlyoffice-desktopeditors.png

	sed -i \
		's|^Exec=.*|Exec=~/.local/bin/onlyoffice|' \
		~/.local/share/applications/onlyoffice-desktopeditors.desktop
}

source "${cwd}/_main.sh"

main "$@"
