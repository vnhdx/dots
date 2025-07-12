#!/usr/bin/env bash

main() {
	if [ "$1" == "disable" ]; then
		disable
	else
		enable
	fi
}

enable() {
	echo 'zram => enable'
	sudo modprobe zram

	# zramctl /dev/zram0 --algorithm zstd --size "$(($(grep -Po 'MemTotal:\s*\K\d+' /proc/meminfo) / 2))KiB"
	sudo zramctl /dev/zram0 --algorithm zstd --size '8G'
	sudo mkswap -U clear /dev/zram0
	sudo swapon --discard --priority 100 /dev/zram0
}

disable() {
	echo 'zram => disable'
	sudo swapoff /dev/zram0
	sudo modprobe -r zram
}

# udev() {
# 	if grep -q '/dev/zram0' /etc/fstab; then
# 		echo 'zram => found in /etc/fstab'
# 	else
# 		local size="${1:-8G}"
# 		cat <<EOF | sudo tee /etc/udev/rules.d/99-zram.rules
# # https://wiki.archlinux.org/title/Zram
# ACTION=="add", KERNEL=="zram0", ATTR{initstate}=="0", ATTR{comp_algorithm}="zstd", ATTR{disksize}="${size}", RUN="/usr/bin/mkswap -U clear %N", TAG+="systemd"
# EOF
# 		echo '/dev/zram0 none swap defaults,discard,pri=100 0 0' | sudo tee -a /etc/fstab
# 		echo 'zram => enable with udev'
# 	fi
# }

main "$@"
