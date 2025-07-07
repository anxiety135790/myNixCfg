{ pkgs,lib, ... }:

{
  virtualisation.vmware.host = {
    enable = true;
    package = (pkgs.vmware-workstation.overrideAttrs rec {
      #src = ../src/VMware-Workstation-Full-17.6.3-24583834.x86_64.bundle;
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
