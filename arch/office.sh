#!/usr/bin/env bash

cwd=$(dirname "$(readlink -f "$0")")

pkgs=(
  # Email
  # thunderbird
  # evolution
  # geary
  # mailspring-bin

  # Docs
  # libreoffice-still
  # libreoffice-fresh
  # onlyoffice-bin

  fastfetch
)


source "${cwd}/_yay.sh"
source "${cwd}/../bin/_main.sh"

main "$@"

# ${cwd}/../bin/onlyoffice.sh
