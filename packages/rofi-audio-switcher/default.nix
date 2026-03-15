{
  lib,
  glib,
  stdenv,
  makeWrapper,
  rofi,
  pulseaudio,
  gawk,
  gnugrep,
  bash,
}:
stdenv.mkDerivation {
  pname = "rofi-audio-switcher";
  version = "1.0";
  src = ./.;
  nativeBuildInputs = [ makeWrapper ];
  installPhase = ''
    runHook preInstall
    install -Dm755 ./script $out/bin/rofi-audio-switcher
    install -Dm644 ./icons/*.png -t $out/share/rofi-audio-switcher/icons/
    wrapProgram $out/bin/rofi-audio-switcher \
      --set ICON_DIR "$out/share/rofi-audio-switcher/icons" \
      --prefix PATH ":" ${
        lib.makeBinPath [
          rofi
          pulseaudio
          gawk
          gnugrep
          bash
        ]
      }
    runHook postInstall
  '';
  meta = with lib; {
    description = "Rofi-based audio input/output switcher using pactl";
    homepage = null;
    license = licenses.mit;
    maintainers = with maintainers; [ kraanzu ];
    mainProgram = "rofi-audio-switcher";
    platforms = platforms.linux;
  };
}
