#!/usr/bin/env bash

# Disable serial port 8250
udev_disable_serial_8250() {
	cat <<EOF | sudo tee /etc/modprobe.d/disable-serial8250.conf
# Disable serial port 8250
blacklist 8250
blacklist 8250_pnp
blacklist serial8250
EOF
}

udev_disable_extra() {
	cat <<EOF | sudo tee /etc/modprobe.d/disable-extra.conf
# Disable fuse, configfs
blacklist fuse
blacklist configfs
EOF
}

# Disable serial port 8250
dracut_disable_modules() {
	cat <<EOF | sudo tee /etc/dracut.conf.d/minimal.conf
# Disable some modules
omit_drivers+=" 8250 8250_pnp floppy pcspkr "
omit_modules+=" bluetooth firewire firewire_core raid6_pq nouveau nvidia nvidiafb "
omit_dracutmodules+=" resume biosdevname "

hostonly="yes"
hostonly_cmdline="yes"
strip="yes"
EOF
}

install() {
	udev_disable_serial_8250
	udev_disable_extra
	dracut_disable_modules

	sudo dracut-rebuild
}

source ../bin/_main.sh

main "$@"

# systemd-boot
# ls "$(sudo bootctl --print-esp-path)/loader/entries/*.conf"
t options = ... loglevel=3 splash nowatchdog 8250.nr_uarts=0 8250.disable=1
