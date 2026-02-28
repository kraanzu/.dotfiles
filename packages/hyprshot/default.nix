{
  lib,
  stdenv,
  makeWrapper,
  hyprpicker,
  grimblast,
  swappy,
  bash,
}:
stdenv.mkDerivation {
  pname = "hyprshot";
  version = "1.0";
  src = ./.;
  nativeBuildInputs = [ makeWrapper ];
  installPhase = ''
    runHook preInstall
    install -Dm755 ./script $out/bin/hyprshot
    wrapProgram $out/bin/hyprshot \
      --prefix PATH ":" ${
        lib.makeBinPath [
          hyprpicker
          swappy
          bash
          grimblast
        ]
      }
    runHook postInstall
  '';
  meta = with lib; {
    description = "Screenshot wrapper using hyprpicker, grim, slurp, and swappy";
    homepage = null;
    license = licenses.mit;
    mainProgram = "hyprshot";
    platforms = platforms.linux;
  };
}
