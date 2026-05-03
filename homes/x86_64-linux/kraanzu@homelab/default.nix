{ lib, ... }:
with lib.mynix;
{
  mynix = {
    secrets.all.enable = false;
  };

  programs.home-manager.enable = true;
  home.stateVersion = "26.05";
}
