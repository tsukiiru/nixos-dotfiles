{
  config,
  pkgs,
  inputs,
  ...
}:
let
  src = import ./home-manager/sourcing.nix { };
in
{
  imports = [
    inputs.zen-browser.homeModules.twilight-official
    inputs.nixcord.homeModules.nixcord
  ];

  home = {
    username = "tsuki";
    homeDirectory = "/home/tsuki";
    stateVersion = "25.05";
  }
  // src;

  programs = import ./home-manager/programs/main.nix { };
}
