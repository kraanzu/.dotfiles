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
    ./ts.nix
    ./nix.nix
    ./markdown.nix
  ];
}
