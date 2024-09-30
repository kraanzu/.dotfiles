{
  imports = [

    # base devel
    ./_base.nix

    # langs
    ./python.nix
    ./zig.nix
    ./rust.nix
    ./go.nix
    ./lua.nix
    ./nix.nix
    ./markdown.nix
  ];
}
