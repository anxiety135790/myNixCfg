{
  # Garbage collect the Nix store
  nix.gc = {
    automatic = true;
    # Change how often the garbage collector runs (default: weekly)
    frequency = "weekly";
    #options = " --delete-older-than 5d";
  };
}
