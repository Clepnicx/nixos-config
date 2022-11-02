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
      bitwarden 
      conda
      discord
      firefox
      gaphor
      gnome.gnome-boxes
      handbrake
      jetbrains.pycharm-community
      jetbrains.idea-community
      marktext
      makemkv
      nextcloud-client
      openscad
      openconnect
      papirus-icon-theme
      pinta
      qbittorrent
      retroarch 
      tdesktop    # telegram client 
      thunderbird
      tor-browser-bundle-bin
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
        nixosconf = "sudo vim /etc/nixos/configuration.nix";
        homeconf = "sudo vim /etc/nixos/home.nix";
        rg = "ranger";	
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
      	kitty_mod = "ctrl+alt";    # kitty modifyer
      };
      
      keybindings = {
      	"kitty_mod+enter" = "new_window";
      	"kitty_mod+l" = "next_layout";
      };   	
    };

    # Vim configuration
    programs.vim = {
      enable = true;
      # custom .vimrc lines
      extraConfig = 
        ''
          set expandtab
          set tabstop=4
          set softtabstop=4
          set wildmenu
          set showmatch

          syntax enable
          filetype indent on
          colorscheme industry

          nnoremap j <Left>
          nnoremap k <Down>
          nnoremap l <Up>
          nnoremap ö <Right>
        '';
	
    };
    
    # git configuration
    programs.git = {
      enable = true;
      userEmail = "flemminghunter@posteo.de";
      userName = "Flemming Jäger";
    };

    # Nextclod-Client on startup
    services.nextcloud-client = {
      enable = true;
      startInBackground = true;
    };

  };
  
}
