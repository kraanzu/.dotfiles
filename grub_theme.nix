{ pkgs }:

let
  fs = pkgs.lib.fileset;
  source_folder = /home/kraanzu/.dotfiles/others;
  source_file = /home/kraanzu/.dotfiles/others/grub_theme;
in
pkgs.stdenv.mkDerivation {
  name = "nixos-grub-theme";
  src = fs.toSource {
    root = source_folder;
    fileset = source_file;
  };
  installPhase = ''
    mkdir -p $out
    cp -v -R ./grub_theme/* $out
    rm -rf ./grub_theme
   '';
}
