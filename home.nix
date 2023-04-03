# my home configuration

{ config, pkgs, ... }:

let
  home-manager = builtins.fetchTarball "https://github.com/nix-community/home-manager/archive/release-22.05.tar.gz";
in

{
  imports = [
    (import "${home-manager}/nixos")
  ];

  home-manager.users.clepnicx = {
    home.packages = with pkgs; [ 
      anki
      ansible
      ansible-lint
      bitwarden
      cider
      discord
      firefox
      gnome.gnome-boxes
      gparted
      handbrake
      jetbrains.pycharm-professional
      jetbrains.idea-ultimate
      losslesscut-bin
      marktext
      makemkv
      micro
      nextcloud-client
      onlyoffice-bin
      openscad
      openconnect
      papirus-folders
      papirus-icon-theme
      qbittorrent
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

    # Nextclod-Client on startup
    services.nextcloud-client = {
      enable = true;
      startInBackground = true;
    };

  };
  
}
