#!/usr/bin/env sh

cwd=$(dirname "$(readlink -f "$0")")

cfg="$1"

diff -r "${cwd}/../.config/${cfg}" "$HOME/.config/${cfg}"
