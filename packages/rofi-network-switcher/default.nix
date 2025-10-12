{
  lib,
  stdenv,
  makeWrapper,
  rofi,
  networkmanager,
  gawk,
  gnugrep,
  bash,
}:

stdenv.mkDerivation {
  pname = "rofi-network-switcher";
  version = "1.0";

  src = ./.;

  nativeBuildInputs = [ makeWrapper ];

  installPhase = ''
    runHook preInstall
    install -Dm755 ./script $out/bin/rofi-network-switcher
    wrapProgram $out/bin/rofi-network-switcher \
      --prefix PATH ":" ${
        lib.makeBinPath [
          rofi
          networkmanager
          gawk
          gnugrep
          bash
        ]
      }
    runHook postInstall
  '';

  meta = with lib; {
    description = "Rofi-based network switcher using nmcli";
    homepage = null;
    license = licenses.mit;
    maintainers = with maintainers; [ kraanzu ];
    mainProgram = "rofi-network-switcher";
    platforms = platforms.linux;
  };
}
