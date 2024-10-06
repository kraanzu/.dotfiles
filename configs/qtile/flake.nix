{
  description = "Development environment with Python 3.11, Qtile, and Qtile-extras";

  outputs = { self, nixpkgs }: {
    devShell.x86_64-linux =
      let
        pkgs = nixpkgs.legacyPackages.x86_64-linux;
      in pkgs.mkShell {
        buildInputs = with pkgs; [
          python311
          python311Packages.qtile
          python311Packages.qtile-extras
        ];

        shellHook = ''
          export PYTHONPATH=$PYTHONPATH:${toString ./src}
          echo "Welcome to your Python development environment with Qtile and Qtile_extras!"
        '';
      };
  };
}
