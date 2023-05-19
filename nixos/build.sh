#!/usr/bin/env sh

# sudo cp system/* /etc/nixos/
# sudo nixos-rebuild switch
#

# mkdir -p ~/.config/home-manager
# cp -r * ~/.config/home-manager
sudo nixos-rebuild switch --flake .
