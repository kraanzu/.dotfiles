{ config, lib, pkgs, ... }:

with lib;

let
  sddm_chili = pkgs.stdenv.mkDerivation rec {
    pname = "sddm-chili";
    version = "0.1.5";

    src = pkgs.fetchFromGitHub {
      owner = "MarianArlt";
      repo = pname;
      rev = version;
      sha256 = "sha256-wxWsdRGC59YzDcSopDRzxg8TfjjmA3LHrdWjepTuzgw="; # Replace with the correct hash
    };

    installPhase = ''
      mkdir -p $out
      cp -r ./* $out
    '';

    buildPhase = "true";
  };
in
{
  options = {
    sddm_chili = lib.mkOption {
      type = lib.types.bool;
      default = false;
      description = "Enable the SDDM Chili package.";
    };
  };

  config = mkIf config.sddm_chili.enable {
    environment.systemPackages = [
      libsForQt5.qt5.qtgraphicaleffects
      libsForQt5.qt5.qtquickcontrols2
      sddm_chili
    ];

    services.displayManager.sddm = {
     theme="${sddm_chilli}";
    };

  };
}

