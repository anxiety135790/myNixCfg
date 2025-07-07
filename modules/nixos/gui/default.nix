{
  imports = [
    #./gnome.nix

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
}
