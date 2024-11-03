{
  description = "Felix NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.05";
    home-manager = {
      url = "github:nix-community/home-manager/release-24.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs@{ nixpkgs, home-manager, ... }: {
    nixosConfigurations = {

      nixos = let 
        username = "felix";
        specialArgs = {inherit username;};
      in
       nixpkgs.lib.nixosSystem {
        inherit specialArgs;
        system = "x86_64-linux";

        modules = [
          ./hosts/nixos
          ./users/${username}/nixos.nix

          # make home-manager as a module of nixos
          # so that home-manager configuration will be deployed automatically when executing `nixos-rebuild switch`
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;

            home-manager.users.${username} = import ./users/${username}/home.nix;
            home-manager.extraSpecialArgs = inputs // specialArgs;
          }
        ];
      };
    };
  };
}
