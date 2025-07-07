#!/usr/bin/env sh

cwd=$(dirname "$(readlink -f "$0")")

cfgs="$@"

for cfg in ${cfgs}; do
	echo "${cfg} => copy"
	cp -r "${cwd}/../.config/${cfg}" "$HOME/.config/"
	echo '==> done'
done
