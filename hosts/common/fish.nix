{
  programs.fish.enable = true;

  programs.fish.shellAliases = {
    nix-shell = "nix-shell --run fish";
    cleanup = "nix-env --delete-generations 3d &&  home-manager expire-generations \"-3 days\" && nix-collect-garbage -d";
  };
}
