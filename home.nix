{ lib, ... }:
{
  imports = import ./home/imports.nix { } ++ [ ./home/portals.nix ];

  nixpkgs.config.allowUnfreePredicate =
    pkg:
    builtins.elem (lib.getName pkg) [
      "discord"
      "spotify"
    ];

  home = {
    username = "tsuki";
    homeDirectory = "/home/tsuki";
    stateVersion = "25.05";
  }
  // import ./config/sourcing.nix { };
}
