# KDE desktop configuration
{ config, pkgs, stdenv, fetchFromGitHub, ... }:

{ 
  # KDE specific packages
  environment.systemPackages = with pkgs; [ 
    ark
    kate
    libsForQt5.sddm-kcm
    libsForQt5.bismuth
  ];

  # Enable the Plasma 5 Desktop Environment.
  services.xserver = {
    enable = true;
    layout = "de";
    displayManager.sddm = {
      enable = true;
      theme = "${(pkgs.fetchFromGitHub {
        owner = "MarianArlt";
        repo = "kde-plasma-chili";
        rev = "a371123959676f608f01421398f7400a2f01ae06";
        sha256 = "fWRf96CPRQ2FRkSDtD+N/baZv+HZPO48CfU5Subt854=";	
      })}";
    };
    desktopManager.plasma5.enable = true;
  };

  # install gnome keyrings
  services.gnome.gnome-keyring.enable = true;
  security.pam.services.sddm.enableGnomeKeyring = true;

  # install desktop integration portals for flatpks
  xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
}
