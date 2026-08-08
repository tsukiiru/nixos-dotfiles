{ inputs, pkgs, ... }:
{
  home.packages = with pkgs; [
    xwayland-satellite-unstable
    xdg-desktop-portal-gnome
    xdg-desktop-portal-gtk
    xdg-desktop-portal-wlr
  ];

  imports = [ inputs.niri.homeModules.niri ];
  programs.niri.enable = true;

  programs.niri.settings = {
    input = {
      spawn-at-startup = [
        { argv = [ "noctalia-shell" ]; }
        { argv = [ "chameleos" ]; } # very cool screen annotation tool
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
            action.toggle-overview = true;
            repeat = false;
          };
          "Mod+Q" = {
            action.close-window = true;
            repeat = false;
          };

          "Mod+H".action.focus-column-left = true;
          "Mod+J".action.focus-column-down = true;
          "Mod+K".action.focus-column-up = true;
          "Mod+L".action.focus-column-right = true;

          "Mod+WheelScrollDown" = {
            action.focus-workspace-down = true;
            cooldown-ms = 150;
          };
          "Mod+WheelScrollUp" = {
            action.focus-workspace-up = true;
            cooldown-ms = 150;
          };
          "Mod+Shift+WheelScrollDown" = {
            action.focus-workspace-right = true;
            cooldown-ms = 150;
          };
          "Mod+Shift+WheelScrollUp" = {
            action.focus-workspace-left = true;
            cooldown-ms = 150;
          };

          "Mod+Shift+H".action.move-column-left = true;
          "Mod+Shift+J".action.move-column-to-workspace-down = true;
          "Mod+Shift+K".action.move-column-to-workspace-up = true;
          "Mod+Shift+L".action.move-column-right = true;

          "Mod+Tab".action.focus-workspace-previous = true;
          "Mod+BracketLeft".action.consume-or-expel-window-left = true;
          "Mod+BracketRight".action.consume-or-expel-window-right = true;

          "Mod+C".action.center-column = true;
          "Mod+S".action.toggle-window-floating = true;
          "Mod+Shift+S".action.switch-focus-between-floating-and-tiling = true;

          "Mod+F".action.maximize-column = true;
          "Mod+Shift+F".action.fullscreen-window = true;
          "Mod+Minus".action.set-column-width = [ "-10%" ];
          "Mod+Equal".action.set-column-width = [ "+10%" ];
          "Mod+Shift+Minus".action.set-window-height = [ "-10%" ];
          "Mod+Shift+Equal".action.set-window-height = [ "+10%" ];

          "Print".action.screenshot = true;
          "Ctrl+Print".action.screenshot-screen = true;
          "Alt+Print".action.screenshot-window = true;

          "Mod+Shift+E".action.quit = true;
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
        screenshot-ui-open.kind.easing.duration-ms = 500;
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

      debug.honor-xdg-activation-with-invalid-serial = true;

      outputs."eDP-1" = {
        mode.width = 1600;
        mode.height = 900;
        mode.refresh = 60;

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
          display = "#ebbcba70";
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
              namespace = "^noctalia-wallpaper";
            }
          ];
          place-within-backdrop = true;
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
    };
  };
}
