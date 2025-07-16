#!/usr/bin/env bash

cwd=$(dirname "$(readlink -f "$0")")

pkgs=(
	zip   # Compressor/archiver for creating and modifying zipfiles
	unzip # For extracting and viewing files in .zip archives
	# xz    # Library and command line tools for XZ and LZMA compressed files
	# libglu1-mesa

	cmake # A cross-platform open-source make system
	clang # C language family frontend for LLVM
	ninja # Small build system with a focus on speed

	# jdk-openjdk
	# android-sdk-cmdline-tools-latest
)

_install() {
	# Flutter
	# mise use -g flutter
	# flutter doctor --android-licenses

	# Java SDK
	# mise use -g java@lts

	# Android SDK
	mise use -g android-sdk
	sdkmanager "platform-tools"
	# sdkmanager "platform-tools" "platforms;android-36" "build-tools;36.0.0"

	# Environment
	cat <<EOF >>~/.bashrc

# Flutter
export PATH="\$HOME/.pub-cache/bin:\$PATH"
export CHROME_EXECUTABLE=/usr/bin/firefox
EOF
}

source "${cwd}/_yay.sh"
source "${cwd}/../bin/_main.sh"

main "$@"
