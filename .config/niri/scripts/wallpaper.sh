#!/usr/bin/bash

unsplash() {
	echo 'https://unsplash.it/1920/1080/?random'
}

bing() {
	local base_url='https://bing.com'
	local api="${base_url}/HPImageArchive.aspx?format=js&idx=0&n=1&mkt="
	local url=$(curl -s "${api}" | jq -r '.images[0].url')

	echo "${base_url}/${url}"

	# local url='https://peapix.com/bing/feed?country='
	# local api='https://bing.biturl.top?resolution=UHD&format=json&mkt=random'
	# local url=$(curl -s "${api}" | jq -r '.url')
	# echo "${url}"
}

download() {
	local provider="$1"

	if declare -f "${provider}" &>/dev/null; then
		notify-send -u low -t 5000 "${provider}" 'Download the new wallpaper'
		url=$(eval "${provider}")
		curl -sLo ~/.cache/wallpaper.jpg $(eval "${provider}")
	fi
}

main() {
	local provider="${1:-bing}"

	download "${provider}"
	systemctl --user restart swaybg.service
}

main
