{
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  ...
}: {
  imports = [
    ./fish.nix
    ./qtile.nix
    ./wezterm.nix
    ./starship.nix
    ./openrgb.nix
    ./dooit.nix
    ./rofi.nix
    ./dunst.nix
    ./nvim.nix
  ];

  nixpkgs = {
    # You can add overlays here
    overlays = [
      outputs.overlays.additions
      outputs.overlays.modifications
      outputs.overlays.unstable-packages
    ];
    # Configure your nixpkgs instance
    config = {
      allowUnfree = true;
    };
  };

  home = {
    username = "kraanzu";
    homeDirectory = "/home/kraanzu";
  };

  # Add stuff for your user as you see fit:
  # programs.neovim.enable = true;
  # home.packages = with pkgs; [ steam ];

  programs.home-manager.enable = true;
  programs.git.enable = true;
  # home.file.".config/wezterm/wezterm.lua".source = ../configs/wezterm/wezterm.lua;
  # home.file.".config/fish".source = ../configs/fish;

  # In your home.nix or wherever your Home Manager configuration resides
  # home.file."fish_config" = {
  #   source = ../configs/fish;
  #   target = ".config/fish"; # This is where you want to symlink it to
  # };

  systemd.user.startServices = "sd-switch";
  home.stateVersion = "23.11";
}
