#!/usr/bin/bash

set -ex

output="${1:-eDP-1}"

# Is disabled, turn it on
if niri msg outputs | tr '\n' '; ' | grep -i "${output}.*Disabled"; then
	niri msg output eDP-1 on
else
	# Turn off
	niri msg output eDP-1 off
fi
