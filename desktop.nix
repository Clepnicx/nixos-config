# Configuration for my Desktop

{ config, pkgs, ... }:

{
  # install offical NVIDIA drivers
  services.xserver.videoDrivers = [ "nvidia" ];
  hardware.opengl.enable = true;

  # hostname of the machine
  networking.hostName = "i7-4790k";

}
