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
     vscodium
     rime-ls
     rime-ice
     gemini-cli

     
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
    


  virtualisation.vmware.host = {
    enable = true;
    package = (pkgs.vmware-workstation.overrideAttrs rec {
      src = ../src/VMware-Workstation-Full-17.6.3-24583834.x86_64.bundle;
      unpackPhase = 
        let
          vmware-unpack-env = pkgs.buildFHSEnv rec {
            name = "vmware-unpack-env";
            targetPkgs = pkgs: [ pkgs.zlib ];
          };
        in 
          ''
          ${vmware-unpack-env}/bin/vmware-unpack-env -c "sh ${src} --extract unpacked"
          # If you need it, copy the enableMacOSGuests stuff here as well.
          '';
    });
      extraConfig = (
       ''
       mks.gl.allowUnsupportedDrivers = "TRUE"
       mks.vk.allowUnsupportedDrivers = "TRUE"
       ''
      );
  };

  virtualisation.vmware.guest.enable = true;
  ##end of vmware 
 

}