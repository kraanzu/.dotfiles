{
  description = "Kraanzu's NixOS config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    grub2-themes.url = "github:vinceliuice/grub2-themes";

    mysecrets = {
      url = "git+ssh://git@github.com/kraanzu/personal.git?ref=main&shallow=1";
      flake = false;
    };

    mywalls = {
      url = "github:kraanzu/nord_walls";
      flake = false;
    };
  };

  outputs = {
    self,
    nixpkgs,
    home-manager,
    mysecrets,
    mywalls,
    ...
  } @ inputs: let
    inherit (self) outputs;
    system = "x86_64-linux";
    default_config = {
      system = "${system}";
      config = {allowUnfree = true;};
    };

    pkgs = import nixpkgs default_config;
  in {
    packages = import ./pkgs pkgs;
    devShells.x86_64-linux.default = pkgs.mkShell {};
    nixosModules = import ./modules/nixos;
    homeManagerModules = import ./modules/home-manager;

    nixosConfigurations = {
      nzxt = nixpkgs.lib.nixosSystem {
        specialArgs = {
          inherit inputs outputs mysecrets mywalls;
          packages = outputs.packages;
        };
        modules = [
          ./hosts/nzxt
        ];
      };
    };

    homeConfigurations = {
      nzxt = home-manager.lib.homeManagerConfiguration {
        pkgs = pkgs;
        extraSpecialArgs = {
          inherit inputs outputs mysecrets mywalls;
          osConfig = outputs.nixosConfigurations.nzxt.config;
        };
        modules = [
          ./home/nzxt
        ];
      };
    };
  };
}
