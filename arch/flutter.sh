#!/usr/bin/env bash

pkgs=(
  unzip
  xz-utils
  zip
  # libglu1-mesa

  cmake
  clang
  ninja

  # jdk-openjdk
  # android-sdk-cmdline-tools-latest
)

_install() {
  # Flutter
  mise i flutter
  # flutter doctor --android-licenses

  # Java SDK
  mise i java@lts

  # Android SDK
  mise i android-sdk
  sdkmanager "platform-tools" "platforms;android-35" "build-tools;35.0.0"

  # Environment
  cat <<EOF >> ~/.bashrc

# Flutter
export PATH="\$HOME/.pub-cache/bin:\$PATH"
export CHROME_EXECUTABLE=/usr/bin/firefox
EOF
}

source ./_yay.sh
source ../bin/_main.sh

main "$@"
