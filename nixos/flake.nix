{
  description = "NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";

    nix-ld = {
      url = "github:nix-community/nix-ld";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # home-manager = {
    #   url = "github:nix-community/home-manager/release-25.05";
    #   inputs.nixpkgs.follows = "nixpkgs";
    # };
  };

  outputs = { nixpkgs, nixos-hardware, nix-ld, ... } @ inputs:
  let
    system = "x86_64-linux";
  in {
    nixosConfigurations.tp = nixpkgs.lib.nixosSystem {
      inherit system;
      specialArgs = { inherit inputs; }; # this is the important part

      modules = [
        ./system/configuration.nix
        nixos-hardware.nixosModules.lenovo-thinkpad-t490s

        nix-ld.nixosModules.nix-ld
        # The module in this repository defines a new module under (programs.nix-ld.dev) instead of (programs.nix-ld)
        # to not collide with the nixpkgs version.
        { programs.nix-ld.dev.enable = true; }

        # home-manager.nixosModules.home-manager {
        #   home-manager.useGlobalPkgs = true;
        #   home-manager.useUserPackages = true;
        #   home-manager.users.vinh = import ./home/home.nix;
        # }

        # User
        ./home/home.nix
      ];
    };

    # homeConfigurations = {
    #   vinh = home-manager.lib.homeManagerConfiguration {
    #     inherit pkgs;
    #     modules = [ ./home/home.nix ];
    #   };
    # };
  };
}
