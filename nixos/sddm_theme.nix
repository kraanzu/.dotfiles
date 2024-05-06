{ pkgs }:

let
  imgLink = "https://raw.githubusercontent.com/kraanzu/.dotfiles/nixos/others/sddm_theme.zip";
in
pkgs.stdenv.mkDerivation {
  name = "sddm-theme";
  src = pkgs.fetchzip {
    url = imgLink;
    sha256 = "sha256-5Wp3Sv2iDV7aVQzSzYI/YfrUEnRvB+TAX4lta927Sb8=";
  };
  installPhase = ''
    mkdir -p $out
    cp -R ./* $out/
    '';
}
