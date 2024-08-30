{pkgs ? import <nixpkgs> {}}:
pkgs.mkShell {
  buildInputs = [
    pkgs.python311
    pkgs.python311Packages.pip
    pkgs.python311Packages.virtualenv
    pkgs.python311Packages.qtile
    pkgs.python311Packages.qtile-extras
  ];

  shellHook = ''
    export PYTHONPATH=$PYTHONPATH:${toString ./src}
    echo "Welcome to your Python development environment with Qtile and Qtile_extras!"
  '';
}
