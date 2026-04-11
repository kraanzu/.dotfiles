{
  lib,
  stdenv,
  makeWrapper,
  rofi,
  pulseaudio,
  networkmanager,
  grub2,
  gawk,
  gnugrep,
  bash,
  zathura,
}:
stdenv.mkDerivation {
  pname = "rofi-scripts";
  version = "1.0";
  src = ./.;
  nativeBuildInputs = [ makeWrapper ];

  installPhase =
    let
      commonPath = lib.makeBinPath [
        rofi
        gawk
        gnugrep
        bash
      ];
    in
    ''
      runHook preInstall

      install -Dm755 ./scripts/rofi-audio-switcher $out/bin/rofi-audio-switcher
      wrapProgram $out/bin/rofi-audio-switcher \
        --prefix PATH ":" "${commonPath}:${lib.makeBinPath [ pulseaudio ]}"

      install -Dm755 ./scripts/rofi-network-menu $out/bin/rofi-network-menu
      wrapProgram $out/bin/rofi-network-menu \
        --prefix PATH ":" "${commonPath}:${lib.makeBinPath [ networkmanager ]}"

      install -Dm755 ./scripts/rofi-power-menu $out/bin/rofi-power-menu
      wrapProgram $out/bin/rofi-power-menu \
        --prefix PATH ":" "${commonPath}:${lib.makeBinPath [ grub2 ]}"

      install -Dm755 ./scripts/rofi-books $out/bin/rofi-books
      wrapProgram $out/bin/rofi-books \
        --prefix PATH ":" "${commonPath}:${lib.makeBinPath [ zathura ]}"

      install -Dm755 ./scripts/rofi-bluetooth $out/bin/rofi-bluetooth
      wrapProgram $out/bin/rofi-bluetooth \
        --prefix PATH ":" "${commonPath}"

      install -Dm755 ./scripts/rofi-dns $out/bin/rofi-dns
      wrapProgram $out/bin/rofi-dns \
        --prefix PATH ":" "${commonPath}"

      runHook postInstall
    '';

  meta = with lib; {
    description = "Rofi-based utility scripts";
    license = licenses.mit;
    maintainers = with maintainers; [ kraanzu ];
    platforms = platforms.linux;
  };
}
