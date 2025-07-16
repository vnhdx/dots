#!/usr/bin/env bash

cwd=$(dirname "$(readlink -f "$0")")

pkgs=(
	kubectl # A command line tool for communicating with a Kubernetes API server
	k9s     # TUI for managing Kubernetes clusters and pods
	helm    # The Kubernetes Package Manager
)

cfgs=(
)

source "${cwd}/_yay.sh"
source "${cwd}/../bin/_main.sh"

main "$@"
