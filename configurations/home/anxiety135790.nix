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
  };

  home.stateVersion = "24.11";
}
