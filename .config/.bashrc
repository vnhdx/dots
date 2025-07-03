#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '

export QT_QPA_PLATFORMTHEME=qt6ct
export QT_STYLE_OVERRIDE=GTK+

export TERMINAL=footclient
export BROWSER=firefox
export EDITOR=nvim

export GTK_THEME=Adwaita:dark
# export XCURSOR_THEME=Adwaita
# export ICON_THEME=Adwaita

# Bin
export PATH="$HOME/.local/bin:$PATH"

# Mise
eval "$(mise activate bash)"

# Go
export GOBIN="$HOME/.local/bin"

# Flutter
export PATH="$HOME/.pub-cache/bin:$PATH"
export CHROME_EXECUTABLE=/usr/bin/firefox
