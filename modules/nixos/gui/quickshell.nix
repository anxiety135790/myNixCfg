{
 pkgs,flake,lib, ... 
}:
let 
inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";

    quickshell = {
      # add ?ref=<tag> to track a tag
      url = "git+https://git.outfoxxed.me/outfoxxed/quickshell";

      # THIS IS IMPORTANT
      # Mismatched system dependencies will lead to crashes and other issues.
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
in
{
  environment.systemPackages = with pkgs; [
    quickshell
   

    xorg.libxcb
    kdePackages.qtbase
    kdePackages.qtgraphs
    kdePackages.qtdeclarative
    kdePackages.qtmultimedia

    qt6Packages.qt5compat
    libsForQt5.qt5.qtgraphicaleffects



     #Niri desktop environment
     waybar # Status bar
     wofi # Application launcher
     mako # Notification daemon
     swaybg # Wallpaper utility
     swaylock # Screen locker
     grim # Screenshot utility
     slurp # For selecting a region for grim
     wdisplays # GUI for display management
     catppuccin-kde
     cava
     gpu-screen-recorder
     xdg-desktop-portal-gnome
     material-symbols
     swww
     wallust
     alacritty

  ];
}
