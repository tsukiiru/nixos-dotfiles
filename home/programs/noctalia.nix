{ inputs, config, ... }:
let
  homeDir = config.home.homeDirectory;
in
{
  imports = [
    inputs.noctalia.homeModules.default
  ];

  programs.noctalia = {
    enable = true;
  };
}
