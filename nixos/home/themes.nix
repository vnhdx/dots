{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    # lxappearance
    nwg-look
    adwaita-icon-theme
  ];

  environment.sessionVariables = {
    GTK_THEME = "Adwaita:dark"; # Optional: Set GTK theme
    XCURSOR_THEME = "Adwaita"; # Optional: Cursor theme
    ICON_THEME = "Adwaita"; # Set icon theme
  };
}
