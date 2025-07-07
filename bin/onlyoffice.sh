#!/usr/bin/env sh

cwd=$(dirname "$(readlink -f "$0")")

install() {
	echo 'onlyoffice => download AppImage'
	wget -O /tmp/onlyoffice https://download.onlyoffice.com/install/desktop/editors/linux/DesktopEditors-x86_64.AppImage
	chmod a+x /tmp/onlyoffice

	mkdir -p ~/.local/bin
	mv /tmp/onlyoffice ~/.local/bin/

	setup
}

setup() {
	echo 'onlyoffice => desktop entry'
	mkdir -p ~/.local/share/applications
	mkdir -p ~/.local/share/icons

	tmpfile=$(mktemp)
	~/.local/bin/onlyoffice --appimage-mount >${tmpfile} &
	sleep 1

	tmpdir=$(cat ${tmpfile})
	rm ${tmpfile}

	cp "${tmpdir}/onlyoffice-desktopeditors.desktop" ~/.local/share/applications/
	cp "${tmpdir}/onlyoffice-desktopeditors.png" ~/.local/share/icons/
	sed -i 's|^Exec=.*|Exec=~/.local/bin/onlyoffice|' ~/.local/share/applications/onlyoffice-desktopeditors.desktop

	pkill onlyoffice

	fusermount -u ${tmpdir}
	rm -rf ${tmpdir}
}

uninstall() {
	echo 'onlyoffice => uninstall'
	rm ~/.local/share/applications/onlyoffice-desktopeditors.desktop
	rm ~/.local/share/icons/onlyoffice-desktopeditors.png
	rm ~/.local/bin/onlyoffice
}

source "${cwd}/_main.sh"

main "$@"
