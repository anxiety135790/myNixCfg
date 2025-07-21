{ pkgs,flake,lib, ... }:

{
  
  environment.systemPackages = with pkgs; [
     vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
     wget
     ntfs3g
     telegram-desktop 
     vivaldi	
     openrazer-daemon
     polychromatic
     ghostty
     fastfetch
     google-cursor
     github-desktop
     git-lfs
     git-lfs-transfer
     tailscale-systray
     parsec-bin
     xsel
     xclip
     wl-clipboard
     #gnomeExtensions.tailscale-qs
     catppuccin-kde
     vscode
     #vscodium
     #tlp-gui
     gemini-cli

     qt6.full
     qtcreator
     gcc
     cmake
     gdb
     pkg-config
     python3

     #umu-launcher
     android-tools

    ];


  fonts.packages = with pkgs; [
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-emoji
    liberation_ttf
    fira-code
    fira-code-symbols
    mplus-outline-fonts.githubRelease
    dina-font
    proggyfonts
  ];
 
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
    




   programs.steam.enable = true;
   hardware.graphics.enable = true;
   hardware.graphics.enable32Bit = true;
   hardware.graphics.extraPackages = with pkgs; [
     amdvlk
       ];
   hardware.graphics.extraPackages32 = with pkgs.driversi686Linux; [
     amdvlk
   ];
   
     


}
