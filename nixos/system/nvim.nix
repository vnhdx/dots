{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    neovim
    ripgrep
    fzf
    lua
    luajitPackages.luarocks
  ];

  environment.sessionVariables = {
    EDITOR = "nvim";
  };
}
