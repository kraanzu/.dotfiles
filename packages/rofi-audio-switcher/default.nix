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

    install -D --target-directory=$out/bin ./rofi-audio-switcher

    wrapProgram $out/bin/rofi-audio-switcher \
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
