{ pkgs, ... }:

{
  programs = {
    firefox.enable = true;
    fish.enable = true;
    appimage = {
      enable = true;
      binfmt = true;
    };
  };

  environment.systemPackages = with pkgs; [
    fish
    curl
    busybox
    jq
    yq

    # gnome-keyring
  ];

  # Default shell
  # programs.bash = {
  #   interactiveShellInit = ''
  #     if [[ $(${pkgs.procps}/bin/ps --no-header --pid=$PPID --format=comm) != "fish" && -z ''${BASH_EXECUTION_STRING} ]]
  #     then
  #       shopt -q login_shell && LOGIN_OPTION='--login' || LOGIN_OPTION=""
  #       exec ${pkgs.fish}/bin/fish $LOGIN_OPTION
  #     fi
  #   '';
  # };

  services = {
    fwupd.enable = true; # LVFS firmware updates
    # Fix touchpad left, middle, right buttons
    libinput = {
      enable = true;
      touchpad = {
        disableWhileTyping = true;
        naturalScrolling = false;
      };
    };


    # Power profiles
    power-profiles-daemon.enable = true;
    # upower.enable = true;

    # For trash and mounts
    gvfs.enable = true;
  };


  powerManagement = {
    enable = true;
    # powertop.enable = true;
  };

  hardware.graphics.enable = true;

  environment.sessionVariables = {
    CHROME_EXECUTABLE = "firefox";
    PATH = [
      "$HOME/bin"
    ];
  };
}
