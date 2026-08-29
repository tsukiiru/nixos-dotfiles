{ inputs, pkgs, ... }:
{
  home.packages = with pkgs; [
    xdg-desktop-portal-gnome
    xdg-desktop-portal-gtk
    xdg-desktop-portal-wlr
  ];

  imports = [ inputs.niri.homeModules.niri ];
  programs.niri.enable = true;

  programs.niri.settings = {
    spawn-at-startup = [
      { argv = [ "noctalia-shell" ]; }
      # { argv = [ "chameleos" ]; } # very cool screen annotation tool
    ];

    binds =
      let
        shell-ipc-call = [
          "noctalia-shell"
          "ipc"
          "call"
        ];
      in
      {
        "Mod+Return".action.spawn = [ "wezterm" ];

        "Mod+Space".action.spawn = shell-ipc-call ++ [
          "launcher"
          "toggle"
        ];
        "Mod+W".action.spawn = shell-ipc-call ++ [
          "sessionMenu"
          "toggle"
        ];
        "Mod+V".action.spawn = shell-ipc-call ++ [
          "launcher"
          "clipboard"
        ];
        "Mod+T".action.spawn = shell-ipc-call ++ [
          "launcher"
          "emoji"
        ];
        "Mod+G".action.spawn = shell-ipc-call ++ [
          "wallpaper"
          "toggle"
        ];

        "Mod+O" = {
          action.toggle-overview = [ ];
          repeat = false;
        };
        "Mod+Q" = {
          action.close-window = [ ];
          repeat = false;
        };

        "Mod+H".action.focus-column-left = [ ];
        "Mod+J".action.focus-column-down = [ ];
        "Mod+K".action.focus-column-up = [ ];
        "Mod+L".action.focus-column-right = [ ];

        "Mod+WheelScrollDown" = {
          action.focus-workspace-down = [ ];
          cooldown-ms = 150;
        };
        "Mod+WheelScrollUp" = {
          action.focus-workspace-up = [ ];
          cooldown-ms = 150;
        };
        "Mod+Shift+WheelScrollDown" = {
          action.focus-workspace-right = [ ];
          cooldown-ms = 150;
        };
        "Mod+Shift+WheelScrollUp" = {
          action.focus-workspace-left = [ ];
          cooldown-ms = 150;
        };

        "Mod+Shift+H".action.move-column-left = [ ];
        "Mod+Shift+J".action.move-column-to-workspace-down = [ ];
        "Mod+Shift+K".action.move-column-to-workspace-up = [ ];
        "Mod+Shift+L".action.move-column-right = [ ];

        "Mod+Tab".action.focus-workspace-previous = [ ];
        "Mod+BracketLeft".action.consume-or-expel-window-left = [ ];
        "Mod+BracketRight".action.consume-or-expel-window-right = [ ];

        "Mod+C".action.center-column = [ ];
        "Mod+S".action.toggle-window-floating = [ ];
        "Mod+Shift+S".action.switch-focus-between-floating-and-tiling = [ ];

        "Mod+F".action.maximize-column = [ ];
        "Mod+Shift+F".action.fullscreen-window = [ ];
        "Mod+Minus".action.set-column-width = [ "-10%" ];
        "Mod+Equal".action.set-column-width = [ "+10%" ];
        "Mod+Shift+Minus".action.set-window-height = [ "-10%" ];
        "Mod+Shift+Equal".action.set-window-height = [ "+10%" ];

        "Print".action.screenshot = [ ];
        "Ctrl+Print".action.screenshot-screen = [ ];
        "Alt+Print".action.screenshot-window = [ ];

        "Mod+Shift+E".action.quit = [ ];
      };

    screenshot-path = "~/Pictures/Screenshots/%Y-%m-%d:%H-%M.png";

    animations = {
      workspace-switch.kind.easing = {
        curve = "ease-out-expo";
        duration-ms = 280;
      };
      overview-open-close.kind.spring = {
        epsilon = 0.0001;
        stiffness = 300;
        damping-ratio = 0.65;
      };
      horizontal-view-movement.kind.easing = {
        curve = "ease-out-expo";
        duration-ms = 280;
      };
      window-movement.kind.spring = {
        epsilon = 0.0001;
        stiffness = 300;
        damping-ratio = 0.65;
      };
      screenshot-ui-open.kind.easing = {
        duration-ms = 500;
        curve = "linear";
      };
      window-open.kind.easing = {
        duration-ms = 400;
        curve = "cubic-bezier";
        curve-args = [
          0.68
          (-0.55)
          0.265
          1.55
        ];
      };
      window-close.kind.easing = {
        duration-ms = 500;
        curve = "cubic-bezier";
        curve-args = [
          0.68
          (-0.55)
          0.265
          1.55
        ];
      };
    };

    # recent-windows when support?

    input = {
      keyboard.numlock = true;
      tablet.calibration-matrix = [
        [
          0.0
          (-1.0)
          1.0
        ]
        [
          1.0
          0.0
          0.0
        ]
      ]; # rotate 90 degree clockwise since my tablet is shitting itself
    };

    debug.honor-xdg-activation-with-invalid-serial = true;

    outputs."eDP-1" = {
      mode.width = 1920;
      mode.height = 1080;
      mode.refresh = 60.0;

      scale = 1.0;
    };

    hotkey-overlay.skip-at-startup = true;

    prefer-no-csd = true;

    overview = {
      workspace-shadow.enable = false;
      zoom = 0.5;
    };

    cursor = {
      theme = "ComixCursors-Black";
      size = 18;
    };

    layout = {
      gaps = 16.0;
      center-focused-column = "never";
      default-column-width = { };
      background-color = "transparent";
      focus-ring = {
        enable = false;
        width = 2.0;
        active = "#ebbcba";
      };
      border = {
        enable = false;
        width = 1.0;
        active = "#76946a";
      };
      insert-hint = {
        enable = true;
        display.color = "#ebbcba70";
      };
      shadow = {
        enable = true;
        softness = 20.0;
        spread = 4.0;
        offset = {
          x = 3.0;
          y = 3.0;
        };
        color = "#00000090";
        draw-behind-window = true;
      };
    };

    window-rules = [
      {
        draw-border-with-background = false;
        clip-to-geometry = true;
        geometry-corner-radius =
          let
            r = 16.0;
          in
          {
            top-left = r;
            top-right = r;
            bottom-left = r;
            bottom-right = r;
          };
      }

      {
        matches = [
          {
            app-id = "^org\\.gnome\\.World\\.Secrets$";
          }
        ];
        block-out-from = "screen-capture";
      }
    ];

    layer-rules = [
      {
        matches = [
          {
            namespace = "^noctalia-wallpaper";
          }
        ];
        place-within-backdrop = true;
      }
    ];
  };
}
