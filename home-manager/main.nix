{ inputs, pkgs, ... }: {
  nixcord = import ./programs/nixcord.nix { inherit inputs pkgs; };
  fish = import ./programs/fish.nix { inherit inputs pkgs; };
  starship = import ./programs/starship.nix { inherit inputs pkgs; };
  spicetify = import ./programs/spicetify.nix { inherit inputs pkgs; };
}
