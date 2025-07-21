# This is your nixos configuration.
# For home configuration, see /modules/home/*
{ pkgs,flake,lib, ... }:
{
  imports = [
    flake.inputs.self.nixosModules.common
    ./services/services.nix
    ./packages/packages.nix
    ./packages/vmware/vmware.nix
    #./packages/tlpui/tlpui.nix
  ];
    


  #
  nix.settings.substituters = [
     "https://mirrors.cernet.edu.cn/nix-channels/store" 
     "https://cache.nixos.org" 
     ];
 
  
  # Configure network proxy if necessary
   networking.proxy.default = "http://127.0.0.1:7890"; #"http://user:password@proxy:port/";
   networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";
  
  #
  #install ibus-rime
  i18n.inputMethod = {
    enable = true;
    type = "fcitx5";
    fcitx5 = {
      waylandFrontend = true;
      addons = with pkgs; [
        kdePackages.fcitx5-qt
        #kdePackages.fcitx5-unikey
        kdePackages.fcitx5-configtool
        kdePackages.fcitx5-with-addons
        kdePackages.fcitx5-chinese-addons
        fcitx5-rime
        rime-ice
      ];
    };
  };  

  hardware.bluetooth.enable = true; # enables support for Bluetooth
  hardware.bluetooth.powerOnBoot = true; # powers up the default Bluetooth controller on boot
  hardware.graphics.enable = true;
  hardware.graphics.enable32Bit = true;

  
  environment = { 
    variables = {
      RIME_USER_DIR = "~/nixos/modules/packages/rime/config";
      QT_QPA_PLATFORMTHEME = "qt6ct";
    };
 
    
  };

  
}
