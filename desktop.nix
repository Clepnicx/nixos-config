# Configuration for my Desktop

{ config, pkgs, ... }:

{ 
  # get function row of keychron keyboard working
  boot.extraModprobeConfig = ''
    options hid_apple fnmode=2
  '';
  
  # install offical NVIDIA drivers
  services.xserver.videoDrivers = [ "nvidia" ];
  hardware.opengl = {
    enable = true;
    driSupport32Bit = true;
  };

  # hostname of the machine
  networking.hostName = "5950x";


  # install steam the correct way
  programs.steam = {
  	enable = true;
  	dedicatedServer.openFirewall = true;    # Open ports in the firewall for Source Dedicated Server
  };
  
}
