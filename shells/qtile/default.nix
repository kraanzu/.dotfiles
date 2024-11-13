{
  pkgs,
  mkShell,
  ...
}:
mkShell {
  packages = with pkgs; [
    fish
    python3Packages.qtile
    python3Packages.qtile-extras
    python3Packages.requests
  ];

  shellHook = ''
    echo "DevShell for Qtile and Qtile_extras!"
    exec fish
    exit
  '';
}
