#!/bin/env sh

get_github_latest_release_url() {
  repo=$1
  pattern=$2
  curl -s "https://api.github.com/repos/${repo}/releases/latest" |
    jq -r ".assets[] | select(.name? | match(\"${pattern}\")) | .browser_download_url"

}

download_github_latest_release() {
  repo=$1
  pattern=$2

  url=$(get_github_latest_release_url "${repo}" "${pattern}")
  filename=$(mktemp)
  wget -O "${filename}" "${url}"

  echo "${filename}"
}
