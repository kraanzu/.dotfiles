{
  description = "Kraanzu's NixOS config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    snowfall-lib = {
      url = "github:snowfallorg/lib";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-index-database.url = "github:nix-community/nix-index-database";
    nix-index-database.inputs.nixpkgs.follows = "nixpkgs";

    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    grub2-themes.url = "github:vinceliuice/grub2-themes/2024-08-19";
    grub2-themes.inputs.nixpkgs.follows = "nixpkgs";

    dooit.url = "github:dooit-org/dooit";
    dooit-extras.url = "github:dooit-org/dooit-extras/nix-fix";

    mysecrets = {
      url = "git+ssh://git@github.com/kraanzu/personal.git?ref=main&shallow=1";
      flake = false;
    };

    mywalls = {
      url = "github:kraanzu/nord_walls";
      flake = false;
    };
  };

  outputs = inputs:
    inputs.snowfall-lib.mkFlake {
      inherit inputs;
      src = ./.;
      snowfall = {
        namespace = "mynix";
        meta = {
          name = "mynix";
          title = "Kraanzu's NixOS config";
        };
      };

      channels-config = {
        allowUnfree = true;
      };

      systems.modules.nixos = with inputs; [
        nix-index-database.nixosModules.nix-index
        grub2-themes.nixosModules.default
        home-manager.nixosModules.home-manager
      ];

      homes.users."kraanzu@nzxt".specialArgs = {
        mysecrets = inputs.mysecrets;
        mywalls = inputs.mywalls;
      };

      homes.modules = with inputs; [
        dooit.homeManagerModules.default
      ];
    };
}
