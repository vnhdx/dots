#!/usr/bin/env sh

cwd=$(dirname "$(readlink -f "$0")")

cfg="$1"

cp -r "${cwd}/../.config/${cfg}" "$HOME/.config/"
