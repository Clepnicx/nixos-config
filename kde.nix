# KDE desktop configuration

{ config, pkgs, ... }:

{ 
  # KDE specific packages
  environment.systemPackages = with pkgs; [
    kate
  ];

  # Enable the Plasma 5 Desktop Environment.
  services.xserver = {
    displayManager.sddm.enable = true;
    desktopManager.plasma5.enable = true;
  };
}
