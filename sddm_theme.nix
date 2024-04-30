{ pkgs }:

let
  fs = pkgs.lib.fileset;
  source_folder = /home/kraanzu/.dotfiles/others;
  source_file = /home/kraanzu/.dotfiles/others/sddm_theme;
in
pkgs.stdenv.mkDerivation {
  name = "sddm-chilli-theme";
  src = fs.toSource {
    root = source_folder;
    fileset = source_file;
  };
  installPhase = ''
    mkdir -p $out
    cp -v -R ./sddm_theme/* $out
    rm -rf ./sddm_theme
   '';
}
