# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ./home.nix 
      ./desktop.nix
      ./gnome.nix
    ]; 
  
  # set kernel to use
  boot.kernelPackages = pkgs.linuxPackages_5_19;

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.efi.efiSysMountPoint = "/boot/efi";

  # enable NTFS support
  boot.supportedFilesystems = [ "ntfs" ];
  
  # enable bluetooth
  hardware.bluetooth.enable = true;
  
  # enable network manager
  networking.networkmanager.enable = true;
  # The global useDHCP flag is deprecated, therefore explicitly set to false here.
  # Per-interface useDHCP will be mandatory in the future, so this generated config
  # replicates the default behaviour.
  networking.useDHCP = false;
  networking.interfaces.enp3s0.useDHCP = true;


  # Set your time zone.
  time.timeZone = "Europe/Berlin";

  # Select internationalisation properties.
  i18n.defaultLocale = "de_DE.UTF-8";
  console = {
    font = "Lat2-Terminus14";
    keyMap = "de";
  };


  # Enable the X11 windowing system.
  services.xserver = {
    enable = true;
    layout = "de";
  };
  
  # Enable CUPS to print documents.
  services.printing = {
  	enable = true;
  	drivers = [ pkgs.hplip ];
  };
  

  # Enable pipewire
  security.rtkit.enable = true;
  services.pipewire = {
  	enable = true;
  	alsa.enable = true;
  	alsa.support32Bit = true;
  	pulse.enable = true;
  	jack.enable = true;
  };

  
  # allow unfree software
  nixpkgs.config.allowUnfree = true; 

  # enable flatpaks
  services.flatpak.enable = true;
  
  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [   
    bpytop 
    cmatrix
    curl  
    ghc
    gparted 
    jdk
    libsecret
    lolcat  
    mpv 
    neofetch 
    python3
    R
    texlive.combined.scheme-medium
    tor
    wget
    xclip  
  ];

  # adding fonts
  fonts.fonts = with pkgs; [
  	nerdfonts
  ]; 
  
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.clepnicx = {
    isNormalUser = true;
    initialPassword = "qwer";
    extraGroups = [ "wheel" "networkmanager" ]; # Enable ‘sudo’ for the user.
    shell = pkgs.zsh;
  };


  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "22.05"; # Did you read the comment?

}

