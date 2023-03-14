# Xmonad configuration

{ config, pkgs, ... }:

{
 environment.systemPackages = with pkgs; [
   rofi
 ];
 
 services.xserver.windowManager.xmonad = {
    enable = true;
    enableContribAndExtras = true;
	# path to xmonad config file
    config = builtins.readFile /home/clepnicx/.xmonad/xmonad.hs;
  };
 
 services = {
     gnome.gnome-keyring.enable = true;
     upower.enable = true;

     blueman.enable = true;
 };

 services.picom = {
     enable = true;
     activeOpacity = 1.0;
     inactiveOpacity = 0.8;
     backend = "glx";
     fade = true;
     fadeDelta = 5;
     #opacityRule = [ "100:name *= 'i3lock'" ];
     shadow = true;
     shadowOpacity = 0.75;
   };

 systemd.services.upower.enable = true;

  

}
