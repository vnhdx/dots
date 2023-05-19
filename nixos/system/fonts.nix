{ config, pkgs, ... }:

{
  fonts = {
    fontDir.enable = true; # Enables font directory
    enableDefaultPackages = true;

    packages = with pkgs; [
      fira-code
      jetbrains-mono
      noto-fonts # Fallback for broad Unicode support
      noto-fonts-emoji
      liberation_ttf

      nerd-fonts.fira-code
      nerd-fonts.droid-sans-mono

      font-awesome
    ];

    fontconfig = {
      defaultFonts = {
        monospace = [
          "Fira Code"
          "JetBrains Mono"
          # "Ubuntu Mono"
        ];
        sansSerif = [
          "Noto Sans"
          # "Ubuntu"
        ];
        serif = [
          "Liberation Serif"
          "Noto Serif"
        ];
      };
    };
  };
}
