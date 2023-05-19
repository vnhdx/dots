{ pkgs, ... }:

{
  boot = {
    # Bootloader
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };

    # By default, the latest LTS linux kernel is installed
    # https://nixos.wiki/wiki/Linux_kernel
    # kernelPackages = pkgs.linuxPackages_6_6; # lts 6.6 6.12
    # kernelPackages = pkgs.linuxPackages_latest; # latest
    kernelPackages = pkgs.linuxPackages_zen; # zen

    kernelParams = [
      # SGX disabled in BIOS
      "nosgx"

      # Avoid touchpad click to tap (clickpad) bug. For more detail see:
      # https://wiki.archlinux.org/title/Touchpad_Synaptics#Touchpad_does_not_work_after_resuming_from_hibernate/suspend
      # "psmouse.synaptics_intertouch=0"
    ];
  };
}
