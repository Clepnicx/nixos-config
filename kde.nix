# KDE desktop configuration

{ config, pkgs, ... }:

{ 
  # KDE specific packages
  environment.systemPackages = with pkgs; [
    kate
    libsForQt5.sddm-kcm
  ];

  # Enable the Plasma 5 Desktop Environment.
  services.xserver = {
    displayManager.sddm.enable = true;
    desktopManager.plasma5.enable = true;
  };

  services.gnome.gnome-keyring.enable = true;
  security.pam.services.sddm.enableGnomeKeyring = true;
  
}
