{ lib, ... }:
with lib.mynix;
{
  mynix = {
    dev.apps.neovim = enabled;
    dev.lang = {
      python = enabled;
      nix = enabled;
      bash = enabled;
    };
  };

  programs.home-manager.enable = true;
  home.stateVersion = "26.05";
}
