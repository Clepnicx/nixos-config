# Configuration for my Desktop

{ config, pkgs, ... }:

{ 
  # desktop specific packages
  environment.systemPackages = with pkgs; [ 
    via
  ];

  # install offical NVIDIA drivers
  services.xserver.videoDrivers = [ "nvidia" ];
  hardware.opengl = {
    enable = true;
    driSupport32Bit = true;
  };

  # hostname of the machine
  networking.hostName = "i7-4790k";

  # install steam the correct way
  programs.steam = {
  	enable = true;
  	dedicatedServer.openFirewall = true;    # Open ports in the firewall for Source Dedicated Server
  };
  
}
