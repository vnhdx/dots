#!/usr/bin/env bash

cwd=$(dirname "$(readlink -f "$0")")

pkgs=(
	git
	lazygit
	bat
	make
	openssl
	protobuf

	# asdf
	# mise

	zed
	# code

	doublecmd
	bcompare
	# meld

	podman
	# helm
	# kubectl
	# k9s
)

cfgs=(
	containers
	lazygit
	zed
)

source "${cwd}/_yay.sh"
source "${cwd}/../bin/_main.sh"

_install() {
	../bin/mise.sh

	cat <<EOF >>~/.bashrc

# Go
export GOBIN="\$HOME/.local/bin"
EOF
}

main "$@"
