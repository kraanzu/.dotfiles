{
  description = "Kraanzu's nix config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.05";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager/release-24.05";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    grub2-themes.url = "github:vinceliuice/grub2-themes";
  };

  outputs = {
    self,
    nixpkgs,
    nixpkgs-unstable,
    home-manager,
    ...
  } @ inputs: let
    inherit (self) outputs;
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
    pkgs-unstable = nixpkgs-unstable.legacyPackages.${system};
  in {
    devShells.x86_64-linux.default = pkgs.mkShell {};
    overlays = import ./overlays {inherit inputs;};
    nixosModules = import ./modules/nixos;
    homeManagerModules = import ./modules/home-manager;

    nixosConfigurations = {
      kraanzu = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs outputs pkgs-unstable;};
        modules = [
          ./hosts/kraanzu
        ];
      };
    };

    homeConfigurations = {
      kraanzu = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.x86_64-linux;
        extraSpecialArgs = {inherit inputs outputs pkgs-unstable;};
        modules = [
          ./home-manager/home.nix
        ];
      };
    };
  };
}
