{pkgs, pkgs-unstable, ...}: {
  environment.systemPackages = with pkgs; [
    discord
    telegram-desktop
  ];
}

