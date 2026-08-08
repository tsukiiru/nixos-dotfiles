{ inputs, pkgs, ... }: {
  # programs that aren't managed by the flake but congfigured via home-manager
  fish = import ./programs/fish.nix { inherit inputs pkgs; };
  starship = import ./programs/starship.nix { inherit inputs pkgs; };
}
