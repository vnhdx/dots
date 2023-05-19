{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    blender
    inkscape-with-extensions
    # gimp-with-extensions
  ];
}
