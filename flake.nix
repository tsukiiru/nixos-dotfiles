{
  description = "flake to keep your head cool even in the most scorchingly hot weather! :3";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";

    nixcord = {
      nixpkgs.follows = "nixpkgs";
      url = "github:FlameFlag/nixcord";
    };
    home-manager = {
      nixpkgs.follows = "nixpkgs";
      url = "github:nix-community/home-manager";
    };
    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      inputs = {
        nixpkgs.follows = "nixpkgs";
        home-manager.follows = "home-manager";
      };
    };
    spicetify-nix = {
      nixpkgs.follows = "nixpkgs";
      url = "github:Gerg-L/spicetify-nix";
    };
  };

  outputs =
    inputs@{
      nixpkgs,
      home-manager,
      ...
    }:
    let
      system = "x86_64-linux";
    in
    {
      nixpkgs.config.allowUnfree = true;

      nixosConfigurations.flake-btw = nixpkgs.lib.nixosSystem {
        inherit system;
        modules = [
          ./configuration.nix
          home-manager.nixosModules.home-manager
          {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              users.tsuki = import ./home.nix;
              extraSpecialArgs = { inherit inputs; };
              backupFileExtension = "backup";
            };
          }
        ];
      };
    };
}
