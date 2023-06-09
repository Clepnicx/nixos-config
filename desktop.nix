# Configuration for my Desktop

{ config, pkgs, ... }:

{ 
  # Desktop specific packages
  environment.systemPackages = with pkgs; [
      cudaPackages.cudatoolkit
    ];
    
  # get function row of keychron keyboard working
  boot.extraModprobeConfig = ''
    options hid_apple fnmode=2
  '';
  
  # make xserver use amdgpu drivers
  services.xserver.videoDrivers = [ "amdgpu" ];
  hardware = {
    opengl = {
      enable = true;
      driSupport = true;
      driSupport32Bit = true;
    };
  };

  # hostname of the machine
  networking.hostName = "5950x";

}
