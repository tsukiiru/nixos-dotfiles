{ inputs, pkgs, ... }:
let
  firefox-addons = inputs.firefox-addons.packages.${pkgs.stdenv.hostPlatform.system};
in
{
  imports = [
    inputs.zen-browser.homeModules.twilight-official
  ];

  programs.zen-browser = {
    enable = true;
    setAsDefaultBrowser = true;

    policies = {
      AutofillAddressEnabled = true;
      AutofillCreditCardEnabled = false;
      DisableAppUpdate = true;
      DisableFeedbackCommands = true;
      DisableFirefoxStudies = true;
      DisablePocket = true;
      DisableTelemetry = true;
      DontCheckDefaultBrowser = true;
      OfferToSaveLogins = false;
      EnableTrackingProtection = {
        Value = true;
        Locked = true;
        Cryptomining = true;
        Fingerprinting = true;
      };
      SanitizeOnShutdown = {
        FormData = true;
        Cache = true;
      };
    };

    profiles.default = {
      # IDs are in zen-sessions.jsonlz4,
      # zen-pins table in places.sqlite in older builds
      #
      # positions dont matter, the order of them is
      spacesForce = true;

      spaces = {
        "stuff :3" = {
          id = "626dcf32-826a-42e4-8af9-5635e0ffc596";
          position = 1000;
          icon = "chrome://browser/skin/zen-icons/selectable/moon.svg";
        };
      };

      pinsForce = true;
      pinsForceAction = "demote";
      pins = {
        #### essentials ####
        "github" = {
          url = "https://github.com";
          position = 10;
          id = "3d57e2ec-a2b7-47b2-a698-9186e90ffe5b";
          isEssential = true;
        };
        "discord" = {
          url = "https://discord.com/channels/@me";
          position = 11;
          id = "120f8d1a-01ac-4ba8-b24c-23f8cfb7c1ac";
          isEssential = true;
        };
        "twitter" = {
          url = "https://twitter.com";
          position = 12;
          id = "b7d508a3-9e15-46ed-a27f-476f3512a6af";
          isEssential = true;
        };

        #### pins ####
        # necessities folder
        "necessities" = {
          id = "626dcf32-826a-42e4-8af9-5635e0ffc596";
          isGroup = true;
          editedTitle = true;
          position = 20;

          pins = {
            "cubic bezier generator" = {
              id = "bea7b8b1-b9e0-4ba7-9815-61831702449b";
              url = "https://www.cssportal.com/css-cubic-bezier-generator";
              position = 21;
            };
            "remove bg" = {
              id = "540e3746-8f43-4f2e-ba56-f81eb48a1f51";
              url = "https://remove.bg";
              position = 22;
            };
            "excalidraw" = {
              id = "f2b14898-93aa-4928-a2cf-d0017f5159c5";
              url = "https://excalidraw.com";
              position = 23;
            };
            "vercel" = {
              id = "bf1bc79c-548a-4139-bdf0-1bee88eab600";
              url = "https://vercel.com";
              position = 24;
            };
            "figma" = {
              id = "388c10e4-cd72-467b-afac-f99aa5f94aae";
              url = "https://figma.com";
              position = 25;
            };
          };
        };
      };

      settings = {
        "zen.view.experimental-no-window-controls" = true;
        "zen.welcome-screen.seen" = true;
        "zen.urlbar.behavior" = "float";
        "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
      };

      presets.betterfox.enable = true;

      extensions = {
        packages = with firefox-addons; [
          ublock-origin
          proton-pass
        ];
      };

      sine = {
        enable = true;
        mods = [
          "macaron"
        ];
      };

      # NOTE: add more search queries
      search = {
        force = true;
        default = "ddg"; # duckduckgo
      };
    };
  };

  home.sessionVariables.MOZ_LEGACY_PROFILES = "1";
}
