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
    home.packages = [
     ];

    # ZSH configuration
    programs.zsh = { 
   	  enable = true;
   	  enableAutosuggestions = true;
   	  enableCompletion = true;
   	  enableSyntaxHighlighting = true;
   	  # zsh shell aliases
   	  shellAliases = {
   	    update = "sudo nixos-rebuild switch";
   	    nixosconf = "sudo micro /etc/nixos/configuration.nix";	
      };
      # oh-my-zsh configuration
      oh-my-zsh = {
        enable = true;
        plugins = [ "git" ];
        # custom = "${pkgs.spaceship-ptompt}";
        theme = "robbyrussell";
      };
    };
  };


}
