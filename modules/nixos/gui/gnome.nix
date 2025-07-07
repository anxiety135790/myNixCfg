{ pkgs, ... }:
{

  services = {
    displayManager.gdm.enable = true;
    desktopManager.gnome.enable = true;

  s};

  environment.systemPackages = with pkgs; [
   pkgs.gnome-tweaks
  ];

}
