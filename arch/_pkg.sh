
#!/usr/bin/env bash

pkgs=${pkgs:-()}

main() {
  while true; do
    case "$1" in
      install)
        install
        shift;;
      uninstall)
        uninstall
        shift;;
      *)
        echo "Usage: $0 {install|uninstall}"
        exit 1
        ;;
    esac
  done
}

install() {
  yay -S $(printf "%s " "${pkgs[@]}")
}

uninstall() {
  yay -Rcns $(printf "%s " "${pkgs[@]}")
}

main $@
