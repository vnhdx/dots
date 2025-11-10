#!/usr/bin/env bash

features=(
	base
	fonts

	# DE
	# xfce
	# kde

	# WM
	# niri
	# hyprland
	wayfire

	monitoring

	dev
	nvim
	flutter

	# perf

	office
)

for feature in "${features[@]}"; do
	echo "${feature} => install"

	if [ -f "${feature}.sh" ]; then
		bash "arch/${feature}.sh"
	else
		echo "warn => ${feature}.sh not found"
	fi

	echo "${features} => done"
done
