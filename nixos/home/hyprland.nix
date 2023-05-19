{ pkgs, ... }:

{
  programs.hyprland = {
    enable = true;
    # withUWSM = true; # Enable UWSM for Hyprland
    # xwayland = false;
  };

  # https://nixos.wiki/wiki/Thunar
  programs.thunar = {
    enable = true;
    plugins = with pkgs.xfce; [
      thunar-archive-plugin
      thunar-volman
    ];
  };

  # Suppress warnings about environment variables
  i18n.inputMethod.fcitx5.waylandFrontend =  true;

  environment.systemPackages = with pkgs; [
    # Hypr Ecosystem
    # https://wiki.hypr.land/Hypr-Ecosystem/hyprsysteminfo/
    hyprpaper
    hyprpicker
    hypridle
    hyprlock
    # hyprpicker
    # hyprcursor
    hyprsunset
    # hyprpolkitagent
    # hyprcursor
    # hyprutils
    # hyprlang
    # aquamarine
    # hyprgraphics

    # Useful utilities
    # https://wiki.hypr.land/Useful-Utilities/
    waybar # gas eww
    dunst
    libnotify
    rofi-wayland

    # LCD Brightness, player
    brightnessctl
    playerctl

    # Screenshot
    grim
    wf-recorder
    slurp
    wl-clipboard
    hyprshot

    mpv
    imv

    # File namanger
    superfile
    xarchiver

    # Wireless
    overskride
    networkmanagerapplet

    # DM
    greetd.tuigreet
  ];

  # # XDG portal
  # xdg.portal = {
  #   enable = true;
  #   extraPortals = [
  #     pkgs.xdg-desktop-portal-gtk
  #   ];
  # };

  environment.sessionVariables = {
    # Cursor invisible
    WLR_NO_HARDWARE_CURSORS = "1";
    # Hint electron apps to use wayland
    NIXOS_OZONE_WL = "1";
    EDITOR = "nvim";
  };

  # programs.dconf.profiles.user.databases = [
  #   {
  #     lockAll = true; # prevents overriding
  #     settings."org/gnome/desktop/interface" = {
  #       color-scheme = "prefer-dark";
  #       # gtk-theme = "Adwaita";
  #       # icon-theme = "Flat-Remix-Red";
  #       # font-name = "Noto Sans Medium 11";
  #       # document-font-name = "Noto Sans Medium 11";
  #       # monospace-font-name = "Noto Sans Mono Medium 11";
  #     };
  #   }
  # ];

  # Keyring
  services.gnome.gnome-keyring.enable = true;

  ##
  # DM
  ##
  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        # command = "${pkgs.hyprland}/bin/Hyprland";
        # user = "vinh"; # Replace with your actual username
        command = "${pkgs.greetd.tuigreet}/bin/tuigreet -r -c ${pkgs.hyprland}/bin/Hyprland";
      };
    };
  };
}
