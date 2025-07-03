#!/usr/bin/env sh

cwd=$(dirname "$(readlink -f "$0")")

install() {
  source "$(dirname "$0")/git.sh"

  filename=$(download_github_latest_release 'ente-io/ente' 'x86_64.AppImage')

  exit 1
  mkdir -p ~/.local/bin
  mv "${filename}" ~/.local/bin/
}

source "${cwd}/_main.sh"

main "$@"
