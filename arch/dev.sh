#!/usr/bin/env bash

cwd=$(dirname "$(readlink -f "$0")")

pkgs=(
	git      # the fast distributed version control system
	lazygit  # Simple terminal UI for git commands
	bat      # Cat clone with syntax highlighting and git integration
	make     # GNU make utility to maintain groups of programs
	openssl  # The Open Source toolkit for Secure Sockets Layer and Transport Layer Security
	protobuf # Protocol Buffers - Google's data interchange format

	# mise # The front-end to your dev env

	# zed  # A high-performance, multiplayer code editor from the creators of Atom and Tree-sitter
	# code # The Open Source build of Visual Studio Code (vscode) editor

	bcompare # Beyond Compare 5: Compare, sync, and merge files and folders
	# meld   # Compare files, directories and working copies

	podman # Tool and library for running OCI-based containers in pods
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

	# Install zed via the install script instead of the package manager
	curl -f https://zed.dev/install.sh | sh

	cat <<EOF >>~/.bashrc

# Go
export GOBIN="\$HOME/.local/bin"
EOF
}

main "$@"
