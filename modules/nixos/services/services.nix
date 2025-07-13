 { pkgs,flake,lib, ... }:
 
 
 {

  services.xserver.enable = true; # to enable the xorg server
  services.xserver.videoDrivers = [ "amdgpu" ]; # to load the amdgpu kernel module
  
  #
  services.openssh.enable = true;

  #
  services.tailscale = {
    enable = true;
    #useRoutingFeatures = "both";
  };
  #
  services.teamviewer = {
    enable = true;
  };


  services.mihomo = {
    enable = true;
    tunMode = true;
    configFile = ../packages/mihomo/config.yaml;
  }; 

  # razer mouse 
  hardware.openrazer.enable = true;
  users.users.anxiety135790 = { extraGroups = [ "openrazer" ]; };

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
  
  




  #services.xserver.displayManager.sessionCommands = ''
  #${pkgs.ibus}/bin/ibus-daemon -drx &
  #'';

  services.xserver.displayManager.lightdm.greeters.gtk = {
    enable = true;
    cursorTheme.package = [
      "google_cursor"
    ];
    cursorTheme.name = "GoogleDot-blue";
    cursorTheme.size = 16;
  };
 

  
}
