# Custom packages, that can be defined similarly to ones from nixpkgs
# You can build them using 'nix build .#example'
pkgs: {
  # dooit = pkgs.callPackage ./dooit.nix {};
  smassh = pkgs.callPackage ./smassh.nix {};
}
