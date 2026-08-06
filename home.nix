{
  pkgs,
  inputs,
  ...
}:
let
  conf_src = import ./config/sourcing.nix { };
  extra_programs = import ./home-manager/main.nix { inherit inputs pkgs; };
in
{
  imports = [
    inputs.zen-browser.homeModules.twilight-official
    inputs.nixcord.homeModules.nixcord
    inputs.spicetify-nix.homeManagerModules.default
    ./home-manager/portals.nix
  ];

  home = {
    username = "tsuki";
    homeDirectory = "/home/tsuki";
    stateVersion = "25.05";
  }
  // conf_src;

  programs = extra_programs;
}
