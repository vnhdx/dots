#!/usr/bin/env bash

cwd=$(dirname "$(readlink -f "$0")")

install() {
	curl https://mise.run | sh
}

post_install() {
	eval "$(~/.local/bin/mise activate)"

	# This is required for completions to work in mise
	mise use -g usage

	mise plugins add godot https://github.com/ez-connect/asdf-godot.git

	# Autocomplete for fish
	if command fish -v &>/dev/null; then
		mkdir -p ~/.config/fish/completions
		# ln -sf ~/.asdf/completions/asdf.fish ~/.config/fish/completions/ # pre v0.16
		mise completion fish >~/.config/fish/completions/mise.fish
	fi

	cat <<EOF >>~/.bashrc

# Mise
eval "\$(mise activate bash)"
EOF
}

source "${cwd}/_main.sh"

main "$@"
