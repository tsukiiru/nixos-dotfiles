{
  pkgs,
  inputs,
  ...
}:
let
  conf_src = import ./config/sourcing.nix { };
  extra_programs = import ./home/main.nix { inherit inputs pkgs; };
in
{
  imports = [
    ./home/portals.nix
    ./home/programs/zen-browser.nix
    ./home/programs/nixcord.nix
    ./home/programs/spicetify.nix
    ./home/programs/noctalia.nix
  ];

  home = {
    username = "tsuki";
    homeDirectory = "/home/tsuki";
    stateVersion = "25.05";
  }
  // conf_src;

  programs = extra_programs;
}
