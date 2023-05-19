#!/usr/bin/env sh

install() {
  . "$(dirname "$0")/git.sh"

  filename=$(download_github_latest_release 'asdf-vm/asdf' 'linux-amd64.tar.gz$')
  # output=$(mktemp)
  # wget -O "${output}" "${url}"
  tar xzvf "${filename}" -C ~/bin/
  rm "${filename}"
}

setup() {
  plugins='nodejs bun python golang rust flutter terraform zig'
  for plugin in ${plugins}; do
    asdf plugin add "${plugin}"
  done

  asdf plugin add godot https://github.com/ez-connect/asdf-godot.git
  echo 'plugins => added'

  # # Autocomplete for fish
  if command fish -v &>/dev/null ; then
    mkdir -p ~/.config/fish/completions
    # ln -sf ~/.asdf/completions/asdf.fish ~/.config/fish/completions/ # pre v0.16
    asdf completion fish > ~/.config/fish/completions/asdf.fish

    echo 'fish => add completions'
  fi
}

install
setup
