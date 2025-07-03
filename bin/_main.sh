#!/usr/bin/env bash

# Package will be installed
declare -a pkgs

# Config will be copied to ~/.config
declare -a cfgs

usage() {
  echo "Usage: $0 [install | uninstall]"
}

main() {
  local cmd="${1:-install}"

  case "${cmd}" in
    'install'|'i')
      if declare -f install > /dev/null; then
        install
      else
        echo 'error => missing install() function'
      fi
      ;;
    'uninstall'|'u')
      if declare -f install > /dev/null; then
        uninstall
      else
        echo 'error => missing install() function'
      fi
      ;;
    'help'|'-h'|'--help')
      usage
      ;;
    *)
      usage
      exit 1
      ;;
  esac
}

# main "$@"
