#!/usr/bin/env bash

cwd=$(dirname "$(readlink -f "$0")")

cfgs="$@"

for cfg in ${cfgs}; do
	# echo "=> ${cfg}"
	diff -r "${cwd}/../.config/${cfg}" "$HOME/.config/${cfg}"
done

# cmp.sh | bat -l diff
