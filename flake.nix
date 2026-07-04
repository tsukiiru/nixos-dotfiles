rec {
  description = "flake to keep your head cool even in the most scorchingly hot weather! :3";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    nixcord.url = "github:FlameFlag/nixcord";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      inputs = {
        nixpkgs.follows = "nixpkgs";
        home-manager.follows = "home-manager";
      };
    };
  };

  outputs =
    { nixpkgs, home-manager, ... }:
    let
      home = import ./home.nix;
    in
    {
      nixosConfigurations.flake-btw = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./configuration.nix
          home-manager.nixosModules.home-manager
          {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              users.tsuki = home;
              extraSpecialArgs = { inherit inputs; };
              backupFileExtension = "backup";
            };
          }
        ];
      };
    };
}
