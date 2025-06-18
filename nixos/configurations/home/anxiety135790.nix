{ flake, ... }:
let
  inherit (flake) inputs;
  inherit (inputs) self;
in
{
  imports = [
    self.homeModules.default
  ];

  # Defined by /modules/home/me.nix
  # And used all around in /modules/home/*
  me = {
    username = "anxiety135790";
    fullname = "anxiety135790";
    email = "anxiety135790@gmail.com";
    #proxy = " http://127.0.0.1:7890";
    #https.proxy = "hthp://127.0.0.1:7890";
  };

  home.stateVersion = "25.05";
}
