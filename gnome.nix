# my gnome desktop configuration
{ config, pkgs, ... }:

{ 
  # exclude some of the default gnome apps
  environment.gnome.excludePackages = with pkgs.gnome ; [
  	cheese # webcam tool
  	gnome-music
  	epiphany # web browser
  	geary # email reader
  	totem # video player
  	tali # poker game
  	iagno # go game
  	hitori # sudoku game
  	atomix # puzzle game
  ];

  # install extra gnome apps and extensions
  environment.systemPackages = with pkgs; [
    gnome.gnome-tweaks
    # gnome extensions
    gnomeExtensions.dash-to-dock-for-cosmic 
  ];
  
  # gnome's default is pulseaudio but I use pipewire
  hardware.pulseaudio.enable = false;
  
  # install gnome and gdm
  services.xserver = {
    displayManager.gdm.enable = true;
    desktopManager.gnome.enable = true;
  };
}
