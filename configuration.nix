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
      ./kde.nix
    ];

  # allow unfree software
  nixpkgs.config.allowUnfree = true;
  
  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [  
    ark  
    bpytop 
    cmatrix
    curl  
    ghc
    git 
    gparted 
    libsecret 
    lolcat 
    micro 
    mpv 
    neofetch 
    ranger 
    texlive.combined.scheme-medium 
    tor
    wget
    xclip  
  ];
  
  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # enable NTFS support
  boot.supportedFilesystems = [ "ntfs" ];

  # set kernel to the latest available
  boot.kernelPackages = pkgs.linuxPackages_latest;

  # enable auto updates
  system = {
  	autoUpgrade.enable = true;
  };
  
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
  services.printing.enable = true;

  # Enable pipewire
  security.rtkit.enable = true;
  services.pipewire = {
  	enable = true;
  	alsa.enable = true;
  	alsa.support32Bit = true;
  	pulse.enable = true;
  	jack.enable = true;
  };
    
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
  system.stateVersion = "21.11"; # Did you read the comment?

}

