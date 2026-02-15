{
  lib,
  buildGoModule,
}:

buildGoModule {
  pname = "crule";
  version = "1.0";

  src = ./.;

  vendorHash = "sha256-uwBJAqN4sIepiiJf9lCDumLqfKJEowQO2tOiSWD3Fig=";

  env.CGO_ENABLED = 0;

  meta = with lib; {
    description = "Interactive CLI for managing Cursor rules";
    license = licenses.mit;
    maintainers = with maintainers; [ kraanzu ];
    mainProgram = "crule";
    platforms = platforms.linux;
  };
}
