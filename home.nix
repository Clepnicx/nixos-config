# my home configuration

{ config, pkgs, ... }:

let
  home-manager = builtins.fetchTarball "https://github.com/nix-community/home-manager/archive/release-22.11.tar.gz";
in

{
  imports = [
    (import "${home-manager}/nixos")
  ];

  home-manager.users.clepnicx = {
  
    home.stateVersion = "22.11";
    
    home.packages = with pkgs; [ 
      anki
      ansible
      ansible-lint
      bitwarden
      cider
      discord
      firefox
      gparted
      handbrake
      jetbrains.pycharm-professional
      jetbrains.idea-ultimate
      logseq
      losslesscut-bin
      makemkv
      micro
      nextcloud-client
      onlyoffice-bin
      openscad
      openconnect
      papirus-folders
      papirus-icon-theme
      qbittorrent
      quickemu
      retroarch
      tdesktop    # telegram client
      texlive.combined.scheme-full 
      thunderbird
      vlc
      vscode
      zoom-us
    ];

    # ZSH configuration
    programs.zsh = { 
      enable = true;
      enableAutosuggestions = true;
      enableCompletion = true;
      enableSyntaxHighlighting = true;
      # zsh shell aliases
      shellAliases = {
        rebuild = "sudo nixos-rebuild switch";
        update = "sudo nixos-rebuild switch --upgrade";
        nixosconf = "sudo micro /etc/nixos/configuration.nix";
        homeconf = "sudo micro /etc/nixos/home.nix";	
      };
      # extra lines written to .zshrc 
      initExtra = 
      	''
      	'';
    };

    # Starship Zsh-Theme
    programs.starship = {
      enable = true;
      # starship configuration
      settings = {
        character = {
    	  success_symbol = "[λ](#fd5100)";
    	  error_symbol = "[λ](bold red)";
      	};
      };
    };

    # polybar configuration
    services.polybar = {
      enable = false;
      config = {
      	"bar/top" = {
      	  monitor = "DP-0";
      	  monitor-strict = "true";
      	  monitor-exact = "true";
      	  bottom = "false";
      	  fixed-center = "true";
      	  
      	  width = "100%";
      	  height = "2%";
      	  offset-x = 1080;
      	  offset-y = 127;
      	  radius = 15;
      	  border-size = 2;
      	  padding-right = 1;
      	  
      	  font-0 = "Hack:size=12;2";

      	  modules-left = "ewhm xwindow";
      	  modules-center = "";
      	  modules-right = "alsa date";
      	  separator = "|";
      	  module-margin = 1;
      	  
      	  tray-position = "right";
      	  tray-maxsize = 16;
      	  tray-offset-x = 1;
      	};
      	"module/ewhm" = {
      	  type = "internal/xworkspaces";
      	  enable-click = "true";
      	  label-active-underline = "#1e1e2e";
      	};
      	"module/xwindow" = {
      	  type = "internal/xwindow";
      	  label-maxlen = 30;	
      	};
      	"module/alsa" = {
          type = "internal/alsa";
      	};
      	"module/date" = {
      	  type = "internal/date";
      	  internal = 5;
      	  date = "%d.%m.%y";
      	  time = "%H:%M";
      	  label = "%time%";
      	};
      	
      };
      script = ''
        polybar-msg cmd quit
        echo "---" | tee -a /tmp/polybar.log
        polybar top 2>&1 | tee -a /tmp/polybar.log & disown
        echo "Bars launched..."
      '';
    };
    # run polybar on startup
    systemd.user.services.polybar = {
      Install.WantedBy = [ "graphical-session.target" ];
    };

    # rofi configuration
    programs.rofi = {
      enable = true;
      configPath = "/home/clepnicx/.config/rofi/config.rasi";
      extraConfig = {
      	modi = "drun,file-browser-extended,run,window";
      	icon-theme = "Oranchelo";
      	show-icons = true;
      	drun-display-format = "{icon} {name}";
      	disable-history = false;
      	hide-scrollbar = true;
      	display-drun = "   Apps ";
      	display-file-browser-extended = "  Files";
      	display-run = "   Run ";
      	display-window = "   Window";
      	display-Network = "   Network";
      	sidebar-mode = true;
      };
      cycle = false;
      font = "Hack 13";
      location = "center";
      theme = "catppuccin-mocha";
      terminal = "kitty";
      plugins = [ pkgs.rofi-file-browser ];
    };

    # rofi theme
    home.file.".local/share/rofi/themes/catppuccin-mocha.rasi".text = ''
          * {
              bg-col:  #1e1e2e;
              bg-col-light: #1e1e2e;
              border-col: #1e1e2e;
              selected-col: #1e1e2e;
              blue: #89b4fa;
              fg-col: #cdd6f4;
              fg-col2: #f38ba8;
              grey: #6c7086;
          
              width: 600;
              font: "JetBrainsMono Nerd Font 14";
          }
          
          element-text, element-icon , mode-switcher {
              background-color: inherit;
              text-color:       inherit;
          }
          
          window {
              height: 360px;
              border: 3px;
              border-color: @border-col;
              background-color: @bg-col;
          }
          
          mainbox {
              background-color: @bg-col;
          }
          
          inputbar {
              children: [prompt,entry];
              background-color: @bg-col;
              border-radius: 5px;
              padding: 2px;
          }
          
          prompt {
              background-color: @blue;
              padding: 6px;
              text-color: @bg-col;
              border-radius: 3px;
              margin: 20px 0px 0px 20px;
          }
          
          textbox-prompt-colon {
              expand: false;
              str: ":";
          }
          
          entry {
              padding: 6px;
              margin: 20px 0px 0px 10px;
              text-color: @fg-col;
              background-color: @bg-col;
          }
          
          listview {
              border: 0px 0px 0px;
              padding: 6px 0px 0px;
              margin: 10px 0px 0px 20px;
              columns: 2;
              lines: 5;
              background-color: @bg-col;
          }
          
          element {
              padding: 5px;
              background-color: @bg-col;
              text-color: @fg-col  ;
          }
          
          element-icon {
              size: 25px;
          }
          
          element selected {
              background-color:  @selected-col ;
              text-color: @fg-col2  ;
          }
          
          mode-switcher {
              spacing: 0;
            }
          
          button {
              padding: 10px;
              background-color: @bg-col-light;
              text-color: @grey;
              vertical-align: 0.5; 
              horizontal-align: 0.5;
          }
          
          button selected {
            background-color: @bg-col;
            text-color: @blue;
          }
          
          message {
              background-color: @bg-col-light;
              margin: 2px;
              padding: 2px;
              border-radius: 5px;
          }
          
          textbox {
              padding: 6px;
              margin: 20px 0px 0px 20px;
              text-color: @blue;
              background-color: @bg-col-light;
          }
    ''; 
    
    # kitty configuration
    programs.kitty = {
      enable = true;
      font = {
      	name = "Hack";
      	size = 13;
      };
      
      settings = {
      	scrollback_lines = 20000;
      	enable_audio_bell = false;
      	remember_window_size = "yes";
      	#foreground = "#dddddd";    # foregroung color
      	#background = "#000000";    # background color
      	background_opacity = "0.8";
      	term = "xterm-256color";    # $TERM variable
      	kitty_mod = "ctrl+super";    # kitty modifyer

      	#
      	# Catppuccin-Mocha theme
      	#
      	
      	# The basic colors
      	foreground             = "#CDD6F4";
      	background             = "#1E1E2E";
      	selection_foreground   = "#1E1E2E";
      	selection_background   = "#F5E0DC";
      	
      	# Cursor colors
      	cursor                 = "#F5E0DC";
      	cursor_text_color      = "#1E1E2E";
      	
      	# URL underline color when hovering with mouse
      	url_color              = "#F5E0DC";
      	
      	# Kitty window border colors
      	active_border_color    = "#B4BEFE";
      	inactive_border_color  = "#6C7086";
      	bell_border_color      = "#F9E2AF";
      	
      	# OS Window titlebar colors
      	wayland_titlebar_color = "system";
      	macos_titlebar_color   = "system";
      	
      	# Tab bar colors
      	active_tab_foreground   = "#11111B";
      	active_tab_background   = "#CBA6F7";
      	inactive_tab_foreground = "#CDD6F4";
      	inactive_tab_background = "#181825";
      	tab_bar_background      = "#11111B";
      	
      	# Colors for marks (marked text in the terminal)
      	mark1_foreground = "#1E1E2E";
      	mark1_background = "#B4BEFE";
      	mark2_foreground = "#1E1E2E";
      	mark2_background = "#CBA6F7";
      	mark3_foreground = "#1E1E2E";
      	mark3_background = "#74C7EC";
      	
      	# The 16 terminal colors
      	
      	# black
      	color0 = "#45475A";
      	color8 = "#585B70";
      	
      	# red
      	color1 = "#F38BA8";
      	color9 = "#F38BA8";
      	
      	# green
      	color2  = "#A6E3A1";
      	color10 = "#A6E3A1";
      	
      	# yellow
      	color3  = "#F9E2AF";
      	color11 = "#F9E2AF";
      	
      	# blue
      	color4  = "#89B4FA";
      	color12 = "#89B4FA";
      	
      	# magenta
      	color5  = "#F5C2E7";
      	color13 = "#F5C2E7";
      	
      	# cyan
      	color6  = "#94E2D5";
      	color14 = "#94E2D5";
      	
      	# white
      	color7  = "#BAC2DE";
      	color15 = "#A6ADC8";
      };
      
      keybindings = {
      	"kitty_mod+enter" = "new_window";
      	"kitty_mod+l" = "next_layout";
      };   	
    };

    # micro configuration
    home.file.".config/micro/settings.json".text = ''
      {
      	"colorscheme": "dracula-tc"
      }
    '';

    # Nextclod-Client on startup
    services.nextcloud-client = {
      enable = true;
      startInBackground = true;
    };

  }; 
}
