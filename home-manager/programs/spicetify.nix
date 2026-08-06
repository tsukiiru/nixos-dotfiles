{ inputs, pkgs, ... }:
let
  spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.stdenv.hostPlatform.system};
  themePkg = spicePkgs.themes.text;
in
{
  enable = true;

  enabledExtensions = with spicePkgs.extensions; [
    adblock
    shuffle
    oldSidebar
    betterGenres
  ];
  enabledCustomApps = with spicePkgs.apps; [
    betterLibrary
  ];

  alwaysEnableDevTools = true;
  themePkgs.additionalCss = ''
    /* user settings */
    :root {
        --font-family: "Annotation Mono", monospace;
        --font-size: 14px;
        --font-weight: 400; /* 200 : 900 */
        --line-height: 1.2;

        --font-size-lyrics: 14px; /* 1.5em (default) */

        --font-family-header: "asciid";
        --font-size-multiplier-header: 4;

        --display-card-image: block; /* none | block */
        --display-coverart-image: none; /* none | block */
        --display-header-image: none; /* none | block */
        --display-sidebar-image: block; /* none | block */
        --display-tracklist-image: none; /* none | block */
        --display-spicetify-banner-ascii: block; /* none | block */
        --display-music-banner-ascii: none; /* none | block */

        --border-radius: 0px;
        --border-width: 1px;
        --border-style: solid; /* dotted | dashed | solid | double | groove | ridge | inset | outset */
        --border-transition: 0.2s ease; /* 'none' to disable  */

        --global-nav-margin-top: 0px; /* set to '0px' if you disabled window controls */
    }
  '';
  theme = themePkg;
  colorScheme = "RosePineDawn";
}
