# Custom packages, that can be defined similarly to ones from nixpkgs
# You can build them using 'nix build .#example'
pkgs: {
  cursor = pkgs.callPackage ./cursor.nix {};
  dooit = pkgs.callPackage ./dooit.nix {};
}
