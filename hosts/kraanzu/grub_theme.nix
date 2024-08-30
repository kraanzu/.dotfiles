{pkgs}: let
  imgLink = "https://raw.githubusercontent.com/kraanzu/.dotfiles/nixos/others/grub_theme.zip";
in
  pkgs.stdenv.mkDerivation {
    name = "grub-theme";
    src = pkgs.fetchzip {
      url = imgLink;
      sha256 = "sha256-iUV+6w2qacDEBnXs3YwRSFXqQ6lGZIpqoYKCJ6Xt9Lg=";
    };
    installPhase = ''
      mkdir -p $out
      cp -R ./* $out/
    '';
  }
