{
  description = "Kraanzu's NixOS config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.05";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager/release-24.05";
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
    nixpkgs-unstable,
    home-manager,
    mysecrets,
    mywalls,
    ...
  } @ inputs: let
    inherit (self) outputs;
    system = "x86_64-linux";
    pkgs = import nixpkgs {
      system = "${system}";
      config = {allowUnfree = true;};
    };
    pkgs-unstable = import nixpkgs-unstable {
      system = "${system}";
      config = {allowUnfree = true;};
    };
  in {
    devShells.x86_64-linux.default = pkgs.mkShell {};
    nixosModules = import ./modules/nixos;
    homeManagerModules = import ./modules/home-manager;

    nixosConfigurations = {
      nzxt = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs outputs pkgs-unstable mysecrets mywalls;};
        modules = [
          ./hosts/nzxt
        ];
      };
    };

    homeConfigurations = {
      nzxt = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.x86_64-linux;
        extraSpecialArgs = {
          inherit inputs outputs pkgs-unstable mysecrets mywalls;
          osConfig = outputs.nixosConfigurations.nzxt.config;
        };
        modules = [
          ./home/nzxt
        ];
      };
    };
  };
}
