#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

# Wayland
export MOZ_ENABLE_WAYLAND=1
export MOZ_WAYLAND=1

export QT_QPA_PLATFORM=wayland
export ELECTRON_OZONE_PLATFORM_HINT=auto
export OZONE_PLATFORM_HINT=auto
# export DISPLAY=

# Theme
export GTK_THEME=Adwaita:dark
# XCURSOR_THEME=Adwaita
# ICON_THEME=Adwaita
export QT_QPA_PLATFORMTHEME=qt6ct
# QT_STYLE_OVERRIDE=GTK+

export TERMINAL=footclient
export BROWSER=firefox # firefox chromium
export EDITOR=nvim

# Fcitx
# GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS=@im=fcitx

# Bin
export PATH="$HOME/.local/bin:$PATH"

# Git
# GIT_CONFIG=$HOME/.config/git/config

# Go
# GOBIN="$HOME/.local/bin"

# Flutter
export PATH="$HOME/.pub-cache/bin:$PATH"
export CHROME_EXECUTABLE=/usr/bin/firefox

# Mise
eval "$(mise activate bash)"
