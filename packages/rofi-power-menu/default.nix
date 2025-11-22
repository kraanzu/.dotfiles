{
  lib,
  stdenv,
  makeWrapper,
  rofi,
  grub2,
  gawk,
  gnugrep,
  bash,
}:

stdenv.mkDerivation {
  pname = "rofi-power-menu";
  version = "1.0";
  src = ./.;
  nativeBuildInputs = [ makeWrapper ];
  installPhase = ''
    runHook preInstall
    install -Dm755 ./script $out/bin/rofi-power-menu
    wrapProgram $out/bin/rofi-power-menu \
      --prefix PATH ":" ${
        lib.makeBinPath [
          rofi
          grub2
          gawk
          gnugrep
          bash
        ]
      }
    runHook postInstall
  '';
}
