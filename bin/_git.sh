#!/usr/bin/env bash

get_github_latest_release() {
	local repo=$1
	local pattern=$2

	curl -s "https://api.github.com/repos/${repo}/releases/latest" |
		jq -r ".assets[] | select(.name? | match(\"${pattern}\")) | .browser_download_url"

}

find_github_latest_release() {
	local repo=$1
	local pattern=$2

	curl -s "https://api.github.com/repos/${repo}/releases" |
		jq -r "[.[] | .assets[] | select(.name? | match(\"${pattern}\")) | .browser_download_url][0]"
}

download() {
	local url=$1

	filename=$(mktemp)
	curl -Lso "${filename}" "${url}"
	echo "${filename}"
}
