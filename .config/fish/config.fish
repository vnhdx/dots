# Disable greeting message
# set -g fish_greeting

if status is-interactive
    # Commands to run in interactive sessions can go here
    ~/.local/bin/mise activate fish | source


end
