# My home configuration

{ config, pkgs, ... }:

let
  home-manager = builtins.fetchTarball "https://github.com/nix-community/home-manager/archive/master.tar.gz";
in

{
  imports = [
    (import "${home-manager}/nixos")
  ];

  home-manager.users.clepnicx = {
    home.packages = with pkgs; [ 
      anki 
      bitwarden 
      discord
      firefox 
      jetbrains.pycharm-community 
      kitty 
      mailspring 
      nextcloud-client
      obsidian 
      oh-my-zsh 
      qbittorrent 
      tdesktop    # telegram client
      tor-browser-bundle-bin 
      vscode 
      zsh 
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
      	SPACESHIP_DIR_COLOR="#ff8700"
      	SPACESHIP_CHAR_SYMBOL="λ  "
      	SPACESHIP_CHAR_COLOR_SUCCESS="#9526fd"
      	'';
      # oh-my-zsh configuration
      oh-my-zsh = {
        enable = true;
        plugins = [ "git" ];
        custom = "$HOME/.config/oh-my-zsh-custom";
        theme = "spaceship";
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
      	background = "#2b2e38";    # background color
      	background_opacity = "0.9";
      	term = "xterm-256color";    # $TERM variable
      	kitty_mod = "ctrl+alt";    # kitty modifyer
      };
      keybindings = {
      	"kitty_mod+enter" = "new_window";
      	"kitty_mod+l" = "next_layout";
      };   	
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
