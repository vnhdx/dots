#!/usr/bin/env bash

create_desktop_entry() {
	local appimage_file="$1"
	local desktop_file="$2"
	local icon_file="$3"

	mkdir -p ~/.local/share/applications
	mkdir -p ~/.local/share/icons

	tmpfile=$(mktemp)
	${appimage_file} --appimage-mount >${tmpfile} &
	sleep 1

	tmpdir=$(cat ${tmpfile})
	rm ${tmpfile}

	cp "${tmpdir}/${desktop_file}" ~/.local/share/applications/
	cp "${tmpdir}/${icon_file}" ~/.local/share/icons/

	pkill $(basename ${appimage_file})

	fusermount -u ${tmpdir}
	rm -rf ${tmpdir}
}
