#!/bin/env sh

get_github_latest_release_url() {
  local repo=$1
  local pattern=$2

  curl -s "https://api.github.com/repos/${repo}/releases/latest" |
    jq -r ".assets[] | select(.name? | match(\"${pattern}\")) | .browser_download_url"

}

download_github_latest_release() {
  local repo=$1
  local pattern=$2

  url=$(get_github_latest_release_url "${repo}" "${pattern}")
  echo $url
  exit 1
  filename=$(mktemp)
  wget -O "${filename}" "${url}"

  echo "${filename}"
}
