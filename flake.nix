{
  description = "Nixxer's";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, ... }:
    let
      lib = nixpkgs.lib;
      system = "x86_64-linux";

      # Every directory under ./hosts becomes a nixosConfiguration of the same
      # name, so adding a machine is just adding a folder.
      hosts = lib.attrNames
        (lib.filterAttrs (_: type: type == "directory") (builtins.readDir ./hosts));

      mkHost = host: lib.nixosSystem {
        inherit system;
        modules = [
          ./hosts/${host}
          home-manager.nixosModules.home-manager
          {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              backupFileExtension = "backup";
              users.bloink = import ./home;
            };
          }
        ];
      };
    in
    {
      nixosConfigurations = lib.genAttrs hosts mkHost;
    };
}
