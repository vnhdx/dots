{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    htop
    btop
    neofetch
    tldr

    nix-tree

    wl-clipboard
    # wl-screenrec

    # Terminal
    foot
    # wezterm
    # kitty

    # Disk
    gdu
    gnome-disk-utility

    # Auth
    ente-auth

    # Note
    obsidian
  ];
}
