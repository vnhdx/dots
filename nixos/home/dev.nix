{ pkgs, ... }:

{
  # virtualisation.podman.enable = true;

  # Run unpackaged in nix, such as via asdf-vm
  # https://nix.dev/guides/faq#how-to-run-non-nix-executables
  # programs.nix-ld = {
  #   enable = true;
  #   libraries = with pkgs; [
  #     zlib
  #     glibc
  #     stdenv.cc.cc.lib
  #     gcc
  #     openssl
  #     libGL
  #     gtk3
  #     # libpng
  #     # libuuid
  #     # alsa-lib
  #     # fontconfig
  #     # freetype
  #     # xorg.libX11
  #     # xorg.libXcursor
  #     # xorg.libXrender
  #     # xorg.libXi
  #   ];
  # };

  environment.systemPackages = with pkgs; [
    git
    lazygit
    bat # cat clone syntax highlight & git integration
    doublecmd
    bcompare
    gnumake
    cmake

    nixd # nix language

    # Editor
    vimPlugins.lazy-nvim # nvim lazy load
    zed-editor
    # vscode
    meld

    podman

    # GNU compiler collection
    gcc_multi

    openssl

    protobuf
  ];

  environment.sessionVariables = {
    PATH = [
      "$HOME/.asdf/shims"
    ];
    GOBIN = "$HOME/bin";
  };
}
