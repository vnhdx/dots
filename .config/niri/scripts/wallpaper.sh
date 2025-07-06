#!/usr/bin/bash

unsplash() {
	local api='https://unsplash.it/1920/1080/?random'
	curl -sLo ~/.cache/wallpaper.jpg \
		https://unsplash.it/1920/1080/?random
}

bing() {
	local api='https://bing.com/HPImageArchive.aspx?format=js&idx=0&n=1&mkt=en-US'
	local url=$(curl -s "${api}" | jq -r '.images[0].url')
	curl -sLo ~/.cache/wallpaper.jpg "${url}"
}

download() {
	local provier="$1"
	url=$(unsplash)
	if declare -f "${provider}" &>/dev/null; then
		url=$(eval "${provider}")
		curl -sLo ~/.cache/wallpaper.jpg $(eval "${provider}")
	fi
}

download bing
# download unsplash
