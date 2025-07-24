{ inputs,pkgs,libs, ... }:
{
  imports = [
    ./quickshell.nix

  ];

  services.xserver.enable = true;
  services = {
    #displayManager.gdm.enable = true;
    #desktopManager.gnome.enable = true;
    displayManager.sddm.enable = true;
    #displayManager.sddm.wayland.enable = false;
    desktopManager.plasma6.enable = true;
    displayManager.defaultSession = "plasma";
    #displayManager.defaultSession = "plasmax11";
  };


  #Niri deskop settings 
  programs.niri.enable = true;


  environment.gnome.excludePackages = with pkgs; [
    #baobab      # disk usage analyzer
    #cheese      # photo booth
    #eog         # image viewer
    #epiphany    # web browser
    #gedit       # text editor
    #simple-scan # document scanner
    #totem       # video player
    #yelp        # help viewer
    #evince      # document viewer
    #file-roller # archive manager
    geary       # email client
    seahorse    # password manager
 

    # these should be self explanatory
    #gnome-calculator 
    #gnome-calendar
    #gnome-characters 
    #gnome-clocks 
    gnome-contacts
    gnome-font-viewer 
    gnome-logs 
    gnome-maps 
    #gnome-music 
    #gnome-photos 
    gnome-screenshot
    gnome-system-monitor 
    gnome-weather 
    gnome-disk-utility 
    pkgs.gnome-connections
    gnome-console
  ];

  environment.plasma6.excludePackages = with pkgs.kdePackages; [
    plasma-browser-integration
    konsole
    #elisa
  ];



}
