#!/usr/bin/env bash

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

source ./_yay.sh
source ../bin/_main.sh

_install() {
	../bin/mise.sh

	cat <<EOF >>~/.bashrc

# Go
export GOBIN="\$HOME/.local/bin"
EOF
}

main "$@"
