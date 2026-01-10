{
  description = "Kraanzu's NixOS config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nix-index-database.url = "github:nix-community/nix-index-database";
    nix-index-database.inputs.nixpkgs.follows = "nixpkgs";
    darwin.url = "github:LnL7/nix-darwin/master";
    darwin.inputs.nixpkgs.follows = "nixpkgs";

    snowfall-lib = {
      url = "github:snowfallorg/lib";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    grub2-themes.url = "github:vinceliuice/grub2-themes/2024-08-19";
    grub2-themes.inputs.nixpkgs.follows = "nixpkgs";

    zed.url = "github:zed-industries/zed/v0.217.3";
    nixvim.url = "github:nix-community/nixvim";

    mywalls = {
      url = "github:kraanzu/nord_walls";
      flake = false;
    };
  };

  outputs =
    inputs:
    let
      lib = inputs.snowfall-lib.mkLib {
        inherit inputs;
        src = ./.;
        snowfall = {
          namespace = "mynix";
          meta = {
            name = "mynix";
            title = "Kraanzu's NixOS config";
          };
        };
      };
    in
    lib.mkFlake {
      channels-config = {
        allowUnfree = true;
      };

      systems.modules.nixos = with inputs; [
        nix-index-database.nixosModules.nix-index
        grub2-themes.nixosModules.default
        home-manager.nixosModules.home-manager
      ];

      homes.users."kraanzu@nzxt".specialArgs = {
        mywalls = inputs.mywalls;
      };

      homes.modules = with inputs; [
        nixvim.homeModules.nixvim
      ];
    };
}
