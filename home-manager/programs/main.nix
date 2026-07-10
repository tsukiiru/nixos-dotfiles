{ inputs, pkgs }: {
  zen-browser = import ./zen-browser.nix { };
  nixcord = import ./nixcord.nix { };
  fish = import ./fish.nix { };
  starship = import ./starship.nix { };
  spicetify = import ./spicetify.nix { inherit inputs pkgs; };
}
