#!/usr/bin/env bash

# Package will be installed
declare -a pkgs

# Config will be copied to ~/.config
declare -a cfgs

usage() {
	echo "Usage: $0 [install | uninstall]"
}

main() {
	local cmd="${1:-install}"

	case "${cmd}" in
	'install' | 'i')
		if declare -f install >/dev/null; then
			install
		fi

		if declare -f post_install >/dev/null; then
			post_install
		fi
		;;
	'uninstall' | 'u')
		if declare -f install >/dev/null; then
			uninstall
		fi

		if declare -f post_uninstall >/dev/null; then
			post_uninstall
		fi
		;;
	'help' | '-h' | '--help')
		usage
		;;
	*)
		usage
		exit 1
		;;
	esac
}

# main "$@"
