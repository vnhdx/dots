#!/bin/env bash

set -eu

dryrun=false

common_pkgs=(
  htop
  btop
  ncdu

  # Pacman Frontend
  # octopi

  # Disk (mount, benchmark, iso)
  gnome-disk-utility
  # Emulator
  # qemu-desktop
  # Windows
  # bottles

  # Brightness
  brightnessctl

  #i3wm
  autotiling

  # grub
  grub-btrfs
  inotify-tools
)

keyboard_pkgs=(
  fcitx5-unikey
  fcitx5-gtk
  fcitx5-qt
  fcitx5-configtool
)

terminal_pkgs=(
  fish
  fisher
  xfce4-terminal
  ttf-jetbrains-mono-nerd
  tmux
)

message_pkgs=(
  telegram-desktop
)

email_pkgs=(
  thunderbird
  # evolution
  #geary
  # mailspring-bin
)

office_pkgs=(
  libreoffice-fresh
  # onlyoffice-bin
)

dev_pkgs=(
  code
  doublecmd-qt6
  bcompare
  podman
  kubectl
  helm
  k9s
  make
  jq
  yq
  xclip
  github-cli
)

nvim_pkgs=(
  neovim
  lazygit
  ripgrep
  fzd
  luarocks
)

ask() {
  msg=$*
  printf "%s [Y/n] " "${msg}"
  read -r ok
  ok=${ok:-Y}

  if [ "${ok}" == 'Y' ]; then
    return 0 # 0 = true
  fi

  return 1 # 1 = false
}

# Install packages: install <message> <package1... package2...>
install() {
  msg=$1
  shift
  packages=("$@")

  if ! ask "${msg}"; then
    return 0
  fi

  index=0
  for pkg in "${packages[@]}"; do
    index=$((index + 1))
    echo "${index}. ${pkg}"
  done

  excludes=()
  echo '==> Packages to exclude (eg: 1 2 3)'
  printf '==> '
  read -r excludes

  index=0
  for pkg in "${packages[@]}"; do
    index=$((index + 1))

    ok=true
    for excl in ${excludes}; do
      if [ "${index}" = "${excl}" ]; then
        ok=false
        break
      fi
    done

    if ${ok}; then
      if ${dryrun}; then
        echo "yay -S ${pkg}"
      else
        yay -S --noconfirm "${pkg}"
      fi
    fi
  done
}

install_git() {
  src=$1
  des=$2
  exec="${3:-}"

  if [ -n "${exec}" ]; then
    if [ ! -x "$(command -v "${exec}")" ]; then
      echo 'not found'
      exit
    fi
  fi

  if [ ! -d "${des}" ]; then
    if ${dryrun}; then
      echo "git clone https://github.com/${src} ${des}"
    else
      git clone "https://github.com/${src}" "${des}"
    fi
  fi
}

setup_asdf() {
  # curl -s https://api.github.com/repos/asdf-vm/asdf/releases/latest | grep linux
  # source "$HOME/.asdf/asdf.sh" # pre v0.16

  # Asdf plugins
  asdf update
  asdf plugin add nodejs
  asdf plugin add golang
  asdf plugin add rust
  asdf plugin add flutter
  asdf plugin add bun
  asdf plugin add godot https://github.com/ez-connect/asdf-godot.git

  # Autocomplete for fish
  mkdir -p ~/.config/fish/completions
  # ln -sf ~/.asdf/completions/asdf.fish ~/.config/fish/completions/ # pre v0.16
  asdf completion fish >~/.config/fish/completions/asdf.fish
}

copy_files() {
  srcDir="$1"
  destDir="$2"

  files=$(ls -ap "${srcDir}" | grep -v /)
  for f in ${files}; do
    if [ -f "${destDir}/${f}" ]; then
      if ! ask "Do you want overwrite ${f}?"; then
        continue
      fi
    fi

    if ${dryrun}; then
      echo "Copy ${destDir}/${f}"
    else
      rm -rf "${destDir}/${f}.backup"
      if [ -f "${destDir}/${f}" ]; then
        mv "${destDir}/${f}" "${destDir}/${f}.backup"
      fi

      cp "${srcDir}/${f}" "${destDir}/${f}"
    fi
  done
}

copy_dirs() {
  srcDir="$1"
  destDir="$2"

  dirs=$(ls "${srcDir}")
  for d in ${dirs}; do
    if [ -d "${destDir}/${d}" ]; then
      if ! ask "Do you want overwrite ${destDir}/${d}?"; then
        contine
      fi
    fi

    if ${dryrun}; then
      echo "Copy ${destDir}/${d}"
    else
      rm -rf "${destDir}/${d}.backup"
      mv "${destDir}/${d}" "${destDir}/${d}.backup"
      cp -r "${srcDir}/${d}" "${destDir}/"
    fi
  done
}

main() {
  install 'Common packages?' "${common_pkgs[@]}"
  install 'Keyboard packages?' "${keyboard_pkgs[@]}"
  install 'Termial packages?' "${terminal_pkgs[@]}"
  install 'Message packages?' "${message_pkgs[@]}"
  install 'Email packages?' "${email_pkgs[@]}"
  install 'Office packages?' "${office_pkgs[@]}"
  install 'Development packages?' "${dev_pkgs[@]}"
  install 'Neovim packages?' "${nvim_pkgs[@]}"

  # Tmux plugin manager

  install_git tmux-plugins/tpm "$HOME/.tmux/plugins/tpm"
  #
  # # Multiple runtime version manager
  # install_git asdf-vm/asdf.git "$HOME/.asdf"
  #
  # # Add Asdf-vm plugins
  setup_asdf

  # Copy config files
  copy_files ./home "$HOME"

  # Copy config dirs
  copy_dirs "./home/.config" "$HOME/.config"

  echo '==> Done!'
}

main "$*"
