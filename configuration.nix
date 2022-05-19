{ config, pkgs, ... }: {

  imports = [
    # Include results of hardware scan.
    ./hardware-configuration.nix
  ];


  environment.systemPackages = [
    pkgs.firefox
    pkgs.micro
    pkgs.mailspring
    pkgs.kitty
    pkgs.discord
    pkgs.obsidian
    pkgs.bitwarden
    pkgs.pycharm
    pkgs.steam
    pkgs.anki
    pkgs.syncthing-gtk
    pkgs.tdesktop
    pkgs.nextcloud-client
  ];

  # create user
  users.users.clepnicx = {
    isNormalUser = true;
    home = "/home/clepnicx";
    description = "Clepnicx";
    extraGroups = ["wheel" "networkmanager"];
  };

  # enable xserver and kde
  services.xserver.enable = true;
  services.xserver.desktopManager.plasma5.enable = true;
  services.xserver.libinput.enable = true;

  # enable displaymanager sddm
  services.xserver.displayManager.sddm.enable = true;

  # set keyboard layout
  services.xserver.layout = "de";

  # enable Proprietary NVIDIA drivers
  services.xserver.videoDrivers = [ "nvidia" ];

  # enable flatpak and install desktop integration portal
  services.flatpak.enable = true;
  xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
  
  # zsh configuration
  programs.zsh = { 
    enable = true;
    shellAliases = {};
    history = {
      size = 10000;
    };
    # oh-my-zsh configuration
    oh-my-zsh = {
      enable = true;
      plugins = [ "git" ];
    };
  

  
  };


}