#!/usr/bin/env bash

# Package will be installed
declare -a pkgs

# Config will be copied to ~/.config
declare -a cfgs

get_pkgs() {
	if [ ${#pkgs[@]} -eq 0 ]; then
		return 0
	fi

	echo "${pkgs[@]}"
}

install() {
	names=$(get_pkgs)
	if [ -z "${names}" ]; then
		echo 'warn => no packages'
		return 0
	fi

	echo "install => ${names}"
	yay -S ${names}

	for cfg in "${cfgs[@]}"; do
		cp -r "../.config/${cfg}/" ~/.config/
	done
}

uninstall() {
	names=$(get_pkgs)
	if [ -z "${names}" ]; then
		return
	fi

	yay -R ${names}
}
