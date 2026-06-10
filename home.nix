{
  config,
  pkgs,
  ...
}:
{
  imports = [
    ./modules/neovim.nix
  ];

  home.packages = [
    pkgs.brightnessctl
    pkgs.chromium
    pkgs.firefox
    pkgs.fuzzel
    pkgs.gvfs
    pkgs.libnotify
    pkgs.prismlauncher
    pkgs.thunar
    pkgs.tumbler
    pkgs.typst
    pkgs.xwayland-satellite # xwayland support
    pkgs.zathura
  ];

  home.pointerCursor = {
    package = pkgs.adwaita-icon-theme;
    name = "Adwaita";
    size = 15;
    gtk.enable = true;
  };

  programs.git = {
    enable = true;
    settings = {
      init = {
        defaultBranch = "main";
      };
      user = {
        name = "Hyde Yoo";
        email = "hydeyoo0716@gmail.com";
      };
      gpg.ssh.allowedSignersFile = "${config.home.homeDirectory}/.ssh/allowed_signers";
    };
    signing = {
      key = "${config.home.homeDirectory}/.ssh/git_signing.pub";
      signByDefault = true;
      format = "ssh";
    };
  };

  programs.zsh = {
    enable = true;
    history.size = 10000;
    defaultKeymap = "emacs";
  };

  programs.direnv.enable = true;

  programs.zoxide = {
    enable = true;
    options = [ "--cmd cd" ];
  };

  programs.swaylock = {
    enable = true;
    settings = {
      color = "000000";
    };
  };

  services.swayidle =
    let
      lock = "${pkgs.swaylock}/bin/swaylock --daemonize";
      display = status: "${pkgs.niri}/bin/niri msg action power-${status}-monitors";
      device = "amdgpu_bl2";
    in
    {
      enable = true;
      timeouts = [
        {
          timeout = 60;
          command = "${pkgs.brightnessctl}/bin/brightnessctl -d ${device} -s";
          resumeCommand = "${pkgs.brightnessctl}/bin/brightnessctl -d ${device} -r";
        }
        {
          timeout = 120;
          command = lock;
        }
        {
          timeout = 300;
          command = display "off";
          resumeCommand = display "on";
        }
        {
          timeout = 500;
          command = "${pkgs.systemd}/bin/systemctl suspend";
        }
      ];
      events = {
        before-sleep = (display "off") + "; " + lock;
        after-resume = display "on";
        lock = (display "off") + "; " + lock;
        unlock = display "on";
      };
    };

  programs.foot = {
    enable = true;
    server.enable = true;
    settings = {
      main = {
        font = "Firacode Nerd Font:size=8";
      };
      scrollback.multiplier = 10.0;
      cursor.style = "beam";
      colors-dark = {
        background = "000000";
        foreground = "cccccc";

        selection-foreground = "c8c093";
        selection-background = "2d4f67";

        regular0 = "090618";
        regular1 = "c34043";
        regular2 = "76946a";
        regular3 = "c0a36e";
        regular4 = "7e9cd8";
        regular5 = "957fb8";
        regular6 = "6a9589";
        regular7 = "c8c093";

        bright0 = "727169";
        bright1 = "e82424";
        bright2 = "98bb6c";
        bright3 = "e6c384";
        bright4 = "7fb4ca";
        bright5 = "938aa9";
        bright6 = "7aa89f";
        bright7 = "dcd7ba";

        "16" = "ffa066";
        "17" = "ff5d62";
      };
    };
  };

  programs.fuzzel = {
    enable = true;
    settings = {
      main = {
        icons-enabled = false;
      };
      colors = {
        background = "#080808dd";
        text = "#bdbdbdff";
        prompt = "#80a0ffff";
        placeholder = "#cf87e8ff";
        input = "#c6c6c6ff";
        match = "#79dac8ff";
        selection = "#323437aa";
        selection-text = "#c6c6c6ff";
        selection-match = "#36c692ff";
        counter = "#cf87e8ff";
        border = "#8cc85fff";
      };
    };
  };

  services.mako = {
    enable = true;
    settings = {
      font = "Firacode Nerd Font 11";
      default-timeout = 5000;
      layer = "overlay";
      background-color = "#000000";
    };
  };

  # Theme settings
  dconf.settings = {
    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
    };
  };

  gtk = {
    enable = true;
    theme = {
      name = "Adwaita-dark";
      package = pkgs.gnome-themes-extra;
    };
    gtk4.theme = null;
  };

  qt = {
    enable = true;
    platformTheme.name = "adwaita";
    style = {
      name = "adwaita-dark";
      package = pkgs.adwaita-qt6;
    };
  };

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "25.11"; # Please read the comment before changing.
}
