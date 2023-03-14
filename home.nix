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
      ulauncher
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
      	foreground = "#dddddd";    # foregroung color
      	background = "#000000";    # background color
      	background_opacity = "0.7";
      	term = "xterm-256color";    # $TERM variable
      	kitty_mod = "ctrl+super";    # kitty modifyer
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
