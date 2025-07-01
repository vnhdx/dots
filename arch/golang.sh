#!/usr/bin/env bash

pkgs=(
)

. ./_pkg.sh

install() {
  mise i go
}

uninstall() {
  mise rm go
}

env(){
  cat <<EOF >> ~/.bashrc

# Go
export GOBIN="\$HOME/.local/bin"
EOF
}

env
