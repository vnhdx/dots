#!/usr/bin/env bash

cwd=$(dirname "$(readlink -f "$0")")

pkgs=(
	zip   # Compressor/archiver for creating and modifying zipfiles
	unzip # For extracting and viewing files in .zip archives
	# xz    # Library and command line tools for XZ and LZMA compressed files
	# libglu1-mesa

	clang # C language family frontend for LLVM
	# cmake # A cross-platform open-source make system
	# ninja # Small build system with a focus on speed

	# jdk-openjdk
	# android-sdk-cmdline-tools-latest
)

post_install() {
	eval "$(mise activate)"

	# Flutter
	mise use -g flutter

	# Linux platform
	mise use -g cmake ninja

	# Java SDK
	mise use -g java@18

	# Android SDK
	mise use -g android-sdk
	sdkmanager "platform-tools"
	# sdkmanager "platform-tools" "platforms;android-36" "build-tools;36.0.0"

	# Environment
	cat <<EOF >>~/.bash_profile

# Flutter
export PATH="\$HOME/.pub-cache/bin:\$PATH"
export CHROME_EXECUTABLE=/usr/bin/firefox
EOF
}

source "${cwd}/_main.sh"

main "$@"
