{
  programs.fish.enable = true;

  programs.fish.shellAliases = {
    nix-shell = "nix-shell --run fish";
  };

}
