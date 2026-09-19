{ pkgs, ... }:
{
  wayland.windowManager.niri = {
    enable = true;
    settings = {
      input = {
        keyboard = {
          repeat-delay = 400;
          repeat-rate = 30;
        };
        touchpad = {
          tap = { };
          dwt = { };
          drag = false;
          natural-scroll = { };
          scroll-factor = 0.3;
          click-method = "clickfinger";
        };
      };

      cursor = {
        hide-when-typing = { };
        hide-after-inactive-ms = 3000;
        xcursor-size = 15;
      };

      layout = {
        gaps = 0;
        center-focused-column = "never";
        preset-column-widths._children = [
          { proportion = 0.5; }
        ];
        default-column-width = {
          proportion = 0.5;
        };
        focus-ring = {
          off = { };
        };
        border = {
          off = { };
        };
      };

      gestures = {
        hot-corners = {
          off = { };
        };
      };

      hotkey-overlay = {
        skip-at-startup = { };
      };

      prefer-no-csd = { };
      screenshot-path = "~/Pictures/Screenshots/Screenshot from %Y-%m-%d %H-%M-%S.png";

      animations = {
        # uncomment to turn off all animations
        # off = {};
      };

      binds = {
        "Mod+T" = {
          _props.hotkey-overlay-title = "Open a Terminal: foot";
          spawn = [ "footclient" ];
        };
        "Mod+D" = {
          _props.hotkey-overlay-title = "Run an Application: fuzzel";
          spawn = [ "fuzzel" ];
        };
        "Mod+Alt+L" = {
          _props.hotkey-overlay-title = "Lock the Screen: swaylock";
          spawn = [ "swaylock" ];
        };
        "Mod+Shift+S" = {
          screenshot = { };
        };

        # Window manager binds
        "Mod+Q" = {
          _props.repeat = false;
          close-window = { };
        };

        "Mod+R" = {
          switch-preset-column-width = { };
        };
        "Mod+Ctrl+R" = {
          reset-window-height = { };
        };
        "Mod+Shift+R" = {
          switch-preset-window-height = { };
        };
        "Mod+F" = {
          maximize-column = { };
        };
        "Mod+Ctrl+F" = {
          expand-column-to-available-width = { };
        };
        "Mod+Shift+F" = {
          fullscreen-window = { };
        };

        "Mod+H" = {
          focus-column-left = { };
        };
        "Mod+J" = {
          focus-window-down = { };
        };
        "Mod+K" = {
          focus-window-up = { };
        };
        "Mod+L" = {
          focus-column-right = { };
        };

        "Mod+Ctrl+H" = {
          move-column-left = { };
        };
        "Mod+Ctrl+J" = {
          move-window-down = { };
        };
        "Mod+Ctrl+K" = {
          move-window-up = { };
        };
        "Mod+Ctrl+L" = {
          move-column-right = { };
        };

        "Mod+Shift+H" = {
          focus-monitor-left = { };
        };
        "Mod+Shift+J" = {
          focus-monitor-down = { };
        };
        "Mod+Shift+K" = {
          focus-monitor-up = { };
        };
        "Mod+Shift+L" = {
          focus-monitor-right = { };
        };

        "Mod+Shift+Ctrl+H" = {
          move-column-to-monitor-left = { };
        };
        "Mod+Shift+Ctrl+J" = {
          move-column-to-monitor-down = { };
        };
        "Mod+Shift+Ctrl+K" = {
          move-column-to-monitor-up = { };
        };
        "Mod+Shift+Ctrl+L" = {
          move-column-to-monitor-right = { };
        };

        "Mod+Home" = {
          focus-column-first = { };
        };
        "Mod+End" = {
          focus-column-last = { };
        };
        "Mod+Ctrl+Home" = {
          move-column-to-first = { };
        };
        "Mod+Ctrl+End" = {
          move-column-to-last = { };
        };

        "Mod+Page_Down" = {
          focus-workspace-down = { };
        };
        "Mod+Page_Up" = {
          focus-workspace-up = { };
        };
        "Mod+U" = {
          focus-workspace-down = { };
        };
        "Mod+I" = {
          focus-workspace-up = { };
        };

        "Mod+Ctrl+Page_Down" = {
          move-column-to-workspace-down = { };
        };
        "Mod+Ctrl+Page_Up" = {
          move-column-to-workspace-up = { };
        };
        "Mod+Ctrl+U" = {
          move-column-to-workspace-down = { };
        };
        "Mod+Ctrl+I" = {
          move-column-to-workspace-up = { };
        };

        "Mod+Shift+Page_Down" = {
          move-workspace-down = { };
        };
        "Mod+Shift+Page_Up" = {
          move-workspace-up = { };
        };
        "Mod+Shift+U" = {
          move-workspace-down = { };
        };
        "Mod+Shift+I" = {
          move-workspace-up = { };
        };

        "Mod+1" = {
          focus-workspace = 1;
        };
        "Mod+2" = {
          focus-workspace = 2;
        };
        "Mod+3" = {
          focus-workspace = 3;
        };
        "Mod+4" = {
          focus-workspace = 4;
        };
        "Mod+5" = {
          focus-workspace = 5;
        };
        "Mod+6" = {
          focus-workspace = 6;
        };
        "Mod+7" = {
          focus-workspace = 7;
        };
        "Mod+8" = {
          focus-workspace = 8;
        };
        "Mod+9" = {
          focus-workspace = 9;
        };

        "Mod+Ctrl+1" = {
          move-column-to-workspace = 1;
        };
        "Mod+Ctrl+2" = {
          move-column-to-workspace = 2;
        };
        "Mod+Ctrl+3" = {
          move-column-to-workspace = 3;
        };
        "Mod+Ctrl+4" = {
          move-column-to-workspace = 4;
        };
        "Mod+Ctrl+5" = {
          move-column-to-workspace = 5;
        };
        "Mod+Ctrl+6" = {
          move-column-to-workspace = 6;
        };
        "Mod+Ctrl+7" = {
          move-column-to-workspace = 7;
        };
        "Mod+Ctrl+8" = {
          move-column-to-workspace = 8;
        };
        "Mod+Ctrl+9" = {
          move-column-to-workspace = 9;
        };

        "Mod+BracketLeft" = {
          consume-or-expel-window-left = { };
        };
        "Mod+BracketRight" = {
          consume-or-expel-window-right = { };
        };

        "Mod+Comma" = {
          consume-window-into-column = { };
        };
        "Mod+Period" = {
          expel-window-from-column = { };
        };

        "Mod+Minus" = {
          set-column-width = "-10%";
        };
        "Mod+Equal" = {
          set-column-width = "+10%";
        };

        "Mod+Shift+Minus" = {
          set-window-height = "-10%";
        };
        "Mod+Shift+Equal" = {
          set-window-height = "+10%";
        };

        "Mod+V" = {
          toggle-window-floating = { };
        };
        "Mod+Shift+V" = {
          switch-focus-between-floating-and-tiling = { };
        };

        "Mod+W" = {
          toggle-column-tabbed-display = { };
        };

        "Mod+Escape" = {
          _props.allow-inhibiting = false;
          toggle-keyboard-shortcuts-inhibit = { };
        };

        # Power binds
        "Mod+Shift+P" = {
          power-off-monitors = { };
        };

        # System resource monitor utilities
        "Mod+B" = {
          spawn-sh = ''notify-send Battery: "$(cat /sys/class/power_supply/BAT1/capacity)"%'';
        };
        "Mod+M" = {
          spawn-sh = ''notify-send --expire-time=3000 "$(free -h | awk 'NR==2 {printf "Memory: %s/%s", $3, $2}')"'';
        };
        "Mod+C" = {
          spawn-sh = ''notify-send "$(niri msg pick-color)"'';
        };

        # XF86 keysyms
        "XF86AudioRaiseVolume" = {
          _props.allow-when-locked = true;
          spawn = [
            "wpctl"
            "set-volume"
            "@DEFAULT_AUDIO_SINK@"
            "5%+"
          ];
        };
        "XF86AudioLowerVolume" = {
          _props.allow-when-locked = true;
          spawn = [
            "wpctl"
            "set-volume"
            "@DEFAULT_AUDIO_SINK@"
            "5%-"
          ];
        };
        "XF86AudioMute" = {
          _props.allow-when-locked = true;
          spawn = [
            "wpctl"
            "set-mute"
            "@DEFAULT_AUDIO_SINK@"
            "toggle"
          ];
        };
        "XF86AudioMicMute" = {
          _props.allow-when-locked = true;
          spawn = [
            "wpctl"
            "set-mute"
            "@DEFAULT_AUDIO_SOURCE@"
            "toggle"
          ];
        };
        "XF86AudioPlay" = {
          _props.allow-when-locked = true;
          spawn = [
            "playerctl"
            "play-pause"
          ];
        };
        "XF86AudioStop" = {
          _props.allow-when-locked = true;
          spawn = [
            "playerctl"
            "stop"
          ];
        };
        "XF86AudioPrev" = {
          _props.allow-when-locked = true;
          spawn = [
            "playerctl"
            "previous"
          ];
        };
        "XF86AudioNext" = {
          _props.allow-when-locked = true;
          spawn = [
            "playerctl"
            "next"
          ];
        };
        "XF86MonBrightnessUp" = {
          _props.allow-when-locked = true;
          spawn = [
            "brightnessctl"
            "-d"
            "amdgpu_bl2"
            "--class=backlight"
            "set"
            "+5%"
          ];
        };
        "XF86MonBrightnessDown" = {
          _props.allow-when-locked = true;
          spawn = [
            "brightnessctl"
            "-d"
            "amdgpu_bl2"
            "--class=backlight"
            "set"
            "5%-"
          ];
        };
      };

      # _args for repeated/parameterized top-level nodes
      _children = [
        {
          output = {
            _args = [ "Samsung Display Corp. ATNA40CU05-0  Unknown" ];
            position._props = {
              x = 0;
              y = 0;
            };
            scale = 2.0;
            layout = {
              background-color = "#000000";
            };
          };
        }
        {
          output = {
            _args = [ "Microstep MAG 275QF X30 CE8M406402145" ];
            mode = "2560x1440@300.005";
            position._props = {
              x = 1440;
              y = 0;
            };
            layout = {
              background-color = "#000000";
            };
          };
        }
        {
          output = {
            _args = [ "PNP(GWD) ARZOPA 000000000000" ];
            position._props = {
              x = 3360;
              y = 0;
            };
            layout = {
              background-color = "#000000";
            };
          };
        }
        {
          window-rule._children = [
            {
              match._props = {
                app-id = "^footclient$";
              };
            }
            {
              default-column-width = {
                proportion = 1.0;
              };
            }
          ];
        }
        {
          window-rule._children = [
            {
              match._props = {
                app-id = "^org.prismlauncher.PrismLauncher$";
              };
            }
            {
              default-column-width = {
                proportion = 1.0;
              };
            }
          ];
        }
        {
          window-rule = {
            match._props = {
              app-id = "firefox$";
              title = "^Picture-in-Picture$";
            };
            open-floating = true;
          };
        }
      ];
    };
    portalPackage = null;
  };
}
