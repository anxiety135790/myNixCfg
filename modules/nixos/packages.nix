{ pkgs,flake,lib, ... }:

{
  
  environment.systemPackages = with pkgs; [

    #systemToolkits
     vim 
     wget
     ntfs3g

     #user app
     telegram-desktop 
     vivaldi	


     #razer
     openrazer-daemon
     polychromatic
     
     #terminal 
     ghostty
     fastfetch

     
     google-cursor

     #git tool
     github-desktop
     git-lfs
     git-lfs-transfer

     #tailscale tool
     tailscale-systray
     
     #remote control toolkit
     parsec-bin

     xsel
     xclip
     wl-clipboard
     #gnomeExtensions.tailscale-qs


     vscode

     #AI 
     gemini-cli

     #environment
     qt6.full
     qtcreator
     gcc
     cmake
     gdb
     pkg-config
     python3

     #umu-launcher
     android-tools
     

   

    #Game Mode Packages
    lutris
    winetricks
    (wineWowPackages.stable.override { })
    gamemode
    mangohud
    vkbasalt
    steam
    protonup-qt
  

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
 



  



  #Game Mode setting 
  programs.steam.enable = true;
  hardware.graphics.enable = true;
  hardware.graphics.enable32Bit = true;
  hardware.graphics.extraPackages = with pkgs; [
    amdvlk
  ];
  hardware.graphics.extraPackages32 = with pkgs.driversi686Linux; [
    amdvlk
  ];
   

  #VMWare Workstation and Tools
  virtualisation.vmware.host = {
    enable = true;
    package = (pkgs.vmware-workstation.overrideAttrs rec {
      #src = ./src/VMware-Workstation-Full-17.6.3-24583834.x86_64.bundle;
      src = pkgs.fetchurl {
        url = "https://github.com/anxiety135790/myNixCfg/releases/download/v0.0.1-alpha/Attach.bundle";
        hash = "sha256-eVdZF3KN7UxtC4n0q2qBvpp3PADuto0dEqwNsSVHjuA=";
        };
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



}
