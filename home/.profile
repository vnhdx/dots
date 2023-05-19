#!/bin/env bash

export TERMINAL=xfce4-terminal
# export QT_QPA_PLATFORMTHEME=qt5ct
# export QT_QPA_PLATFORMTHEME=qt6ct

export QT_STYLE_OVERRIDE=GTK+
export BROWSER=firefox
export EDITOR=nvim

# Keboard input: ibus/fcitx
export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS=@im=fcitx

# Local bins
export PATH="$PATH:$HOME/.local/bin"

# asdf-vm
export PATH="$PATH:$HOME/.asdf/shims"

# go, flutter
export PATH="$PATH:$HOME/go/bin:$HOME/.pub-cache/bin"
export JAVA_HOME=/usr/lib/jvm/default-runtime
export GOBIN=$HOME/.local/bin
export CHROME_EXECUTABLE=/usr/bin/firefox

# An issue with webkit2gtk being broken under 2.44 with Nvidia GPUs
# export WEBKIT_DISABLE_DMABUF_RENDERER=1
