{ ... }:
{
  home-manager.users.arete = { config, pkgs, ... }: {
    imports = [
      ./modules/neovim.nix
    ];
    home.packages = [ 
	pkgs.dconf
	pkgs.gvfs
	pkgs.tumbler
    	pkgs.fuzzel
    	pkgs.mako
    	pkgs.swaylock
    	pkgs.thunar
    	pkgs.xwayland-satellite # xwayland support
      	pkgs.brightnessctl 
      	pkgs.prismlauncher
        pkgs.firefox
        pkgs.zathura
    ];

    # This value determines the Home Manager release that your configuration is
    # compatible with. This helps avoid breakage when a new Home Manager release
    # introduces backwards incompatible changes.
    #
    # You should not change this value, even if you update Home Manager. If you do
    # want to update the value, then make sure to first check the Home Manager
    # release notes.
    home.stateVersion = "25.11"; # Please read the comment before changing. 

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
key = "${config.home.homeDirectory}/.ssh/id_ed25519.pub";
signByDefault = true;
format = "ssh";
};
};
    programs.zsh = {
    enable = true;
    history.size = 10000;
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
		programs.foot= {
		enable = true;
		server.enable = true;
		};
};
}
