{ inputs, pkgs }:
let
  spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.stdenv.hostPlatform.system};
in
{
  enable = true;

  enabledExtensions = with spicePkgs.extensions; [
    adblock
    shuffle
  ];
  enabledCustomApps = with spicePkgs.apps; [ ];
  enabledSnippets = with spicePkgs.snippets; [ ];

  theme = spicePkgs.themes.catppuccin;
  colorScheme = "mocha";
}
