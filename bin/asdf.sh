#!/usr/bin/env sh

install() {
  . "$(dirname "$0")/git.sh"

  filename=$(download_github_latest_release 'asdf-vm/asdf' 'linux-amd64.tar.gz$')

  mkdir ~/bin
  tar xzvf "${filename}" -C ~/.local/bin/
  rm "${filename}"
}

setup() {
	plugins='nodejs bun python golang rust flutter terraform zig'
	for plugin in ${plugins}; do
		~/.local/bin/asdf plugin add "${plugin}"
	done

	~/local/bin/asdf plugin add godot https://github.com/ez-connect/asdf-godot.git
	echo 'plugins => added'

	# # Autocomplete for fish
	if command fish -v &>/dev/null ; then
		mkdir -p ~/.config/fish/completions
		# ln -sf ~/.asdf/completions/asdf.fish ~/.config/fish/completions/ # pre v0.16
		~/.local/bin/asdf completion fish > ~/.config/fish/completions/asdf.fish

		echo 'fish => add completions'
	fi
}

env() {
  cat <<EOF >> ~/.bashrc

# asdf-vm
export PATH="\$HOME/.asdf/shims:\$PATH"
EOF
}

install
setup
env
