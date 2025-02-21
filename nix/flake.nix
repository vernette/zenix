{
  description = "NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.11";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager/release-24.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, nixpkgs-unstable, home-manager, ... }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
      unstable = import nixpkgs-unstable {
        inherit system;
        config.allowUnfree = true;
      };
    in
    {
      nixosConfigurations = {
        arcadia = nixpkgs.lib.nixosSystem {
          inherit system;
          modules = [
            ./hosts/arcadia
            home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.users.vernette = import ./home/profiles/arcadia.nix;
              home-manager.extraSpecialArgs = { inherit unstable; };
            }
          ];
          specialArgs = { inherit unstable; };
        };

        luminous = nixpkgs.lib.nixosSystem {
          inherit system;
          modules = [
            ./hosts/luminous
            home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.users.vernette = import ./home/profiles/luminous.nix;
              home-manager.extraSpecialArgs = { inherit unstable; };
            }
          ];
          specialArgs = { inherit unstable; };
        };

        vm = nixpkgs.lib.nixosSystem {
          inherit system;
          modules = [
            ./hosts/vm
            home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.users.vernette = import ./home/profiles/vm.nix;
              home-manager.extraSpecialArgs = { inherit unstable; };
            }
          ];
          specialArgs = { inherit unstable; };
        };
      };
    };
}