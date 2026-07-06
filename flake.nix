{
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
    rust-overlay.url = "github:oxalica/rust-overlay";
  };

  outputs =
    inputs@{
      nixpkgs,
      home-manager,
      rust-overlay,
      ...
    }:
    let
      system = "x86_64-linux";
      overlays = [ (import rust-overlay) ];
      pkgs = import nixpkgs {
        inherit system overlays;
      };
    in
    {
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

      devShells.${system}.default =
        with pkgs;
        mkShell rec {
          buildInputs = [
            pkg-config
            libx11
            libxcursor
            libxrandr
            libxi
            libxcb
            libxkbcommon
            vulkan-loader
            wayland
          ];

          shellHook = ''
            export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:${builtins.toString (pkgs.lib.makeLibraryPath buildInputs)}";
          '';
        };
    };
}
