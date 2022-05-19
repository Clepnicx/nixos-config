{ config, pkgs, ... }: {

  imports = [
    # Include results of hardware scan.
    ./hardware-configuration.nix
  ];

  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = [
    pkgs.firefox
    pkgs.micro
    pkgs.mailspring
    pkgs.kitty
    pkgs.discord
    pkgs.obsidian
    pkgs.bitwarden
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

}