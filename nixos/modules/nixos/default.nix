# This is your nixos configuration.
# For home configuration, see /modules/home/*
{ pkgs,flake, ... }:
{
  imports = [
    flake.inputs.self.nixosModules.common
  ];
    
  nix.settings.substituters = [ "https://mirrors.cernet.edu.cn/nix-channels/store" "https://cache.nixos.org" ];
 
  
  # Configure network proxy if necessary
   networking.proxy.default = "http://127.0.0.1:7890";#"http://user:password@proxy:port/";
   networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";
  
  #
  #install ibus-rime
  i18n.inputMethod = {
    enable = true;
    type = "ibus";
    ibus.engines = with pkgs.ibus-engines; [rime libpinyin pinyin];
   };
  
  #
  services.openssh.enable = true;
  #services.system76-scheduler.enable = true;
  #hardware.system76.power-daemon.enable = true;

  # tlp conflict with power-profile
  services.power-profiles-daemon.enable  = false;
  services.tlp = {
    enable = true;
    settings = {
      CPU_SCALING_GOVERNOR_ON_AC = "performance";
      CPU_SCALING_GOVERNOR_ON_BAT = "powersave";

      CPU_ENERGY_PERF_POLICY_ON_BAT = "power";
      CPU_ENERGY_PERF_POLICY_ON_AC = "performance";

      CPU_MIN_PERF_ON_AC = 0;
      CPU_MAX_PERF_ON_AC = 60;
      CPU_MIN_PERF_ON_BAT = 0;
      CPU_MAX_PERF_ON_BAT = 20;

    # Optional helps save long term battery health
      START_CHARGE_THRESH_BAT0 = 40; # 40 and bellow it starts to charge
      STOP_CHARGE_THRESH_BAT0 = 85;  # 80 and above it stops charging
  };
};
  
  

  # razer mouse 
  hardware.openrazer.enable = true;
  users.users.anxiety135790 = { extraGroups = [ "openrazer" ]; };
  
  environment.systemPackages = with pkgs; [
     vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
     wget
     ntfs3g
     mihomo-party
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
     gnomeExtensions.tailscale-qs
     
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
  
  environment.variables = {
  GTK_IM_MODULE="ibus";
  QT_IM_MODULE="ibus";
  #XMODIFIERS=@im=ibus;

  };
  
  
    virtualisation.vmware.host = {
     enable = true;
     package = (pkgs.vmware-workstation.overrideAttrs rec {
        src = ./src/VMware-Workstation-Full-17.6.3-24583834.x86_64.bundle;
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
  
  # 
  #
  services.xserver.displayManager.lightdm.greeters.gtk = {
    enable = true;
    cursorTheme.package = [
      "google_cursor"
    ];
    cursorTheme.name = "GoogleDot-blue";
    cursorTheme.size = 16;
  };
 
  services.tailscale = {
    enable = true;
    #useRoutingFeatures = "both";
  };
  
  services.teamviewer = {
    enable = true;
  };


 
}
