# This is your nixos configuration.
# For home configuration, see /modules/home/*
{ pkgs,flake,lib, ... }:
{
  imports = [
    flake.inputs.self.nixosModules.common
    ./services/services.nix
    ./packages/packages.nix
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
    type = "ibus";
    ibus.engines = with pkgs.ibus-engines; [rime libpinyin pinyin];
   };
   
  hardware.bluetooth.enable = true; # enables support for Bluetooth
  hardware.bluetooth.powerOnBoot = true; # powers up the default Bluetooth controller on boot
  

   environment.variables = {
     GTK_IM_MODULE = "ibus";
     QT_IM_MODULE = "ibus";
     XMODIFIERS = "@im=ibus";
   };
  

  

  qt.platformTheme = "kde6";
  
  # services.xserver.desktopManager.xterm.enable = false;


 
}
