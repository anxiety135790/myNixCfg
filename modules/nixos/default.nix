# This is your nixos configuration.
# For home configuration, see /modules/home/*
{ pkgs,flake,lib, ... }:
{
  imports = [
    flake.inputs.self.nixosModules.common
    ./services/services.nix
    ./packages/packages.nix
    ./packages/vmware/vmware.nix
  ];
    


  #
  nix.settings.substituters = [ "https://mirrors.cernet.edu.cn/nix-channels/store" "https://cache.nixos.org" ];
 
  
  # Configure network proxy if necessary
   networking.proxy.default = "http://127.0.0.1:7890";#"http://user:password@proxy:port/";
   networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";
  
  #
  #install ibus-rime
  i18n.inputMethod = {
    enable = true;
    #type = "ibus";
    #ibus.engines = with pkgs.ibus-engines; [rime libpinyin pinyin];
    #ibus.panel = "${pkgs.plasma5Packages.plasma-desktop}/libexec/kimpanel-ibus-panel" ;
    type = "fcitx5";
    
    # 2. Add Rime and other essential addons
    fcitx5.addons = with pkgs; [
    fcitx5-rime          # The Rime engine
    fcitx5-gtk           # For GTK4/GTK3/GTK2 applications
    #fcitx5-qt            # For Qt6/Qt5 applications
    fcitx5-configtool    # GUI tool to configure Fcitx5
    # Add any other fcitx5 addons you might need here
    ];
  }; 
  hardware.bluetooth.enable = true; # enables support for Bluetooth
  hardware.bluetooth.powerOnBoot = true; # powers up the default Bluetooth controller on boot
  

   #environment.variables = {
     #GTK_IM_MODULE = "ibus";
     #QT_IM_MODULE = "ibus";
     #unset QT_IM_MODULE;
     #unset GTK_IM_MODULE;
    
     #XMODIFIERS = "@im=ibus";
     #vulkan-loader
   #};

    #environment.sessionVariables = {
    #QT_IM_MODULE = lib.mkForce ""; # Or lib.mkForce null;
    #GTK_IM_MODULE = lib.mkForce ""; # Or lib.mkForce null;
  #};
  

  

  #qt.platformTheme = "kde6";
  
  # services.xserver.desktopManager.xterm.enable = false;


 
}
