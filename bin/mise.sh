#!/usr/bin/env sh

install() {
  curl https://mise.run | sh


}

setup() {
  eval "$(~/.local/bin/mise activate)"

  # This is required for completions to work in mise
  mise use -g usage

  mise plugins add godot https://github.com/ez-connect/asdf-godot.git

  # Autocomplete for fish
  if command fish -v &>/dev/null ; then
    mkdir -p ~/.config/fish/completions
    # ln -sf ~/.asdf/completions/asdf.fish ~/.config/fish/completions/ # pre v0.16
    mise completion fish > ~/.config/fish/completions/mise.fish
  fi
}

env() {
  cat <<EOF >> ~/.bashrc

# Mise
eval "\$(mise activate bash)"
EOF
}

install
setup
env
