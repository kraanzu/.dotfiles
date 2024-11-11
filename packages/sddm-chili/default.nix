{pkgs, ...}:
pkgs.stdenv.mkDerivation rec {
  pname = "sddm-chili";
  version = "0.1.5";

  src = pkgs.fetchFromGitHub {
    owner = "MarianArlt";
    repo = pname;
    rev = version;
    sha256 = "sha256-wxWsdRGC59YzDcSopDRzxg8TfjjmA3LHrdWjepTuzgw=";
  };

  installPhase = ''
    mkdir -p $out
    cp -r ./* $out
  '';

  buildPhase = "true";
}
