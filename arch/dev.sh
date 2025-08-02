#!/usr/bin/env bash

cwd=$(dirname "$(readlink -f "$0")")

pkgs=(
	git      # the fast distributed version control system
	lazygit  # Simple terminal UI for git commands
	tmux     # Terminal multiplexer
	bat      # Cat clone with syntax highlighting and git integration
	make     # GNU make utility to maintain groups of programs
	openssl  # The Open Source toolkit for Secure Sockets Layer and Transport Layer Security
	protobuf # Protocol Buffers - Google's data interchange format

	# zed                    # A high-performance, multiplayer code editor from the creators of Atom and Tree-sitter
	# code                   # The Open Source build of Visual Studio Code (vscode) editor
	# visual-studio-code-bin # Visual Studio Code (vscode): Editor for building and debugging modern web and cloud applications (official binary version)

	bcompare # Beyond Compare 5: Compare, sync, and merge files and folders
	# meld   # Compare files, directories and working copies

	# mise # The front-end to your dev env

	podman # Tool and library for running OCI-based containers in pods
)

cfgs=(
	git
	containers
	lazygit
	tmux
	zed
)

source "${cwd}/_yay.sh"
source "${cwd}/../bin/_main.sh"

_install() {
	../bin/mise.sh

	# Install zed via the install script instead of the package manager
	curl -f https://zed.dev/install.sh | sh

	# Tmux
	git clone https://github.com/tmux-plugins/tpm ~/.config/tmux/plugins/tpm
	~/.config/tmux/plugins/tpm/tpm
	~/.config/tmux/plugins/tpm/bin/install_plugins
}

main "$@"
