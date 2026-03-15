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
    install -Dm644 ./icons/*.png -t $out/share/rofi-power-menu/icons/
    wrapProgram $out/bin/rofi-power-menu \
      --set ICON_DIR "$out/share/rofi-power-menu/icons" \
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
