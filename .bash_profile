#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

# ------------------------------------------------------------------------------
# Global
# ------------------------------------------------------------------------------
export TERMINAL=footclient # footclient wezterm
export BROWSER=firefox     # firefox chromium
export EDITOR=nvim

# ------------------------------------------------------------------------------
# Wayland
# ------------------------------------------------------------------------------
export MOZ_ENABLE_WAYLAND=1
export GDK_BACKEND=wayland
export MOZ_WAYLAND=1

# export GBM_BACKEND=nvidia-drm
# export __GLX_VENDOR_LIBRARY_NAME=nvidia
# export CLUTTER_BACKEND=wayland

export QT_QPA_PLATFORM=wayland
#export QT_QPA_PLATFORM=xcb # disable Wayland BE, fixed for Telegram on Cosmic
export ELECTRON_OZONE_PLATFORM_HINT=auto
export OZONE_PLATFORM_HINT=auto
# export DISPLAY=

# ------------------------------------------------------------------------------
# Theme
# ------------------------------------------------------------------------------
export GTK_THEME=Adwaita:dark
# XCURSOR_THEME=Adwaita
# ICON_THEME=Adwaita
export QT_QPA_PLATFORMTHEME=qt5ct
export QT6_QPA_PLATFORMTHEME=qt6ct
# export QT_STYLE_OVERRIDE=Adwaita-Dark
# export QT_AUTO_SCREEN_SCALE_FACTOR=1

# ------------------------------------------------------------------------------
# Fcitx
# ------------------------------------------------------------------------------
# export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS=@im=fcitx

# Bin
export PATH="$HOME/.local/bin:$HOME/.bun/bin:$PATH"

# ------------------------------------------------------------------------------
# Git
# ------------------------------------------------------------------------------
GIT_CONFIG=$HOME/.config/git/config

# ------------------------------------------------------------------------------
# Mise
# ------------------------------------------------------------------------------
eval "$(mise activate bash)"

# ------------------------------------------------------------------------------
# Go
# ------------------------------------------------------------------------------
GOBIN="$HOME/.local/bin"

# ------------------------------------------------------------------------------
# Flutter
# ------------------------------------------------------------------------------
export PATH="$HOME/.pub-cache/bin:$PATH"
export CHROME_EXECUTABLE=/usr/bin/firefox

# ------------------------------------------------------------------------------
# Nix
# ------------------------------------------------------------------------------
#if [ -e $HOME/.nix-profile/etc/profile.d/nix.sh ]; then
#  . $HOME/.nix-profile/etc/profile.d/nix.sh
#fi # added by Nix installer
