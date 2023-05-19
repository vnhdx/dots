{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    # Message
    telegram-desktop

    # Email
    thunderbird

    # Documents
    onlyoffice-desktopeditors
  ];
}
