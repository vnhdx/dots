{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    htop
    btop
    fastfetch
    tealdeer # tldr client

    nix-tree

    wl-clipboard
    # wl-screenrec

    # Terminal
    foot
    # wezterm
    # kitty

    # Disk
    gdu
    # gnome-disk-utility

    # Note
    obsidian
  ];
}
