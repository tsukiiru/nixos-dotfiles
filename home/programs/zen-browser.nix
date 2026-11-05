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
        "いろいろ :3" = {
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
        "spotify" = {
          url = "https://open.spotify.com";
          position = 12;
          id = "b7d508a3-9e15-46ed-a27f-476f3512a6af";
          isEssential = true;
        };
        "youtube" = {
          url = "https://youtube.com";
          position = 13;
          id = "a34d0539-8ad7-47ad-a247-92115bab8122";
          isEssential = true;
        };

        #### pins ####
        "tools" = {
          id = "1786096061977-58";
          isGroup = true;
          editedTitle = true;
          position = 20;
          workspace = "626dcf32-826a-42e4-8af9-5635e0ffc596";

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
            "desmos" = {
              id = "3f98acf9-c785-419c-a8c6-8e27bb5ff9ed";
              url = "https://desmos.com";
              position = 26;
            };
          };
        };

        "nixos" = {
          id = "1786096061977-59";
          isGroup = true;
          editedTitle = true;
          position = 30;
          workspace = "626dcf32-826a-42e4-8af9-5635e0ffc596";

          pins = {
            "uuid generator" = {
              id = "629b1e2a-5fe3-44bd-9440-f8d45d9ef0c8";
              url = "https://www.uuidgenerator.net/version4";
              position = 31;
            };
          };
        };
      };

      settings = {
        "zen.view.experimental-no-window-controls" = true;
        "zen.welcome-screen.seen" = true;
        "zen.urlbar.behavior" = "float";
        "browser.ctrlTab.sortByRecentlyUsed" = true;
        "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
        "zen.widget.linux.transparency" = true;
        "browser.tabs.allow_transparent_browser" = true;

        "zia.acrylic-reset" = true;
        "zia.cards.blur" = true;
        "zia.compact.hide-toolbar" = false;
        "zia.compact.sidebar-blur" = true;
        "zia.essentials.fill-row" = true;
        "zia.essentials.two-per-row" = true;
        "zia.essentials.zia-width" = true;
        "zia.folders.bounce" = true;
        "zia.folders.tint-card" = true;
        "zia.folders.tint-when-open" = false;
        "zia.glance.thumbnail" = true;
        "zia.haptics.repaired" = true;
        "zia.media.keep-with-pip" = true;
        "zia.media.youtube-channel-art	" = false;
        "zia.multiview.icon-color" = "zia";
        "zia.newtab.focus-address-bar" = false;
        "zia.newtab.real-tab" = false;
        "zia.newtab.search-engine" = false;
        "zia.page.edge-to-edge" = false;
        "zia.pdf.dia-style" = true;
        "zia.pip.tuck-spot" = "nearest";
        "zia.settings.seen-new" =
          "zia.tabs.no-pin-slash,zia.sidebar.see-through,zia.spaces.collapse-icons,zia.urlbar.center-bar,zia.install-count";
        "zia.sidebar-panels.beside" = true;
        "zia.sidebar-panels.style" = true;
        "zia.sidebar.hide-space-name" = false;
        "zia.sidebar.see-through" = 50;
        "zia.sidebar.space-name-in-list" = true;
        "zia.sidebar.text-size" = "	small";
        "zia.sound-bars.always-move" = false;
        "zia.spaces.collapse-icons" = true;
        "zia.status-bar" = true;
        "zia.tab-numbers.always" = true;
        "zia.tab-numbers.color" = "zia";
        "zia.tabs.dim-asleep" = true;
        "zia.tabs.dim-asleep-reset" = true;
        "zia.tabs.favicon-glow	" = true;
        "zia.tabs.no-glow" = false;
        "zia.trim-https-reset" = true;
        "zia.urlbar.center-bar" = true;
        "zia.urlbar.center-text" = true;
        "zia.urlbar.center-text.pop-up-left" = true;
        "zia.urlbar.full-url" = true;
        "zia.urlbar.pop-up-blur" = true;
        "zia.urlbar.site-color" = false;
        "zia.urlbar.title-only" = true;
        "zia.welcome.show" = false;
      };

      presets.betterfox.enable = true;

      extensions = {
        packages = with firefox-addons; [
          ublock-origin
          yomitan
        ];
      };

      sine = {
        enable = true;
        mods = [ ];
        # install manually in sine store since it's quite buggy currently
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
