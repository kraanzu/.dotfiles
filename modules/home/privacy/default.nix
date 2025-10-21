{
  config,
  lib,
  pkgs,
  ...
}:

with lib;
with lib.mynix;

let
  cfg = config.mynix.secrets;
in
{
  options.mynix.secrets = {
    all.enable = mkBoolOpt true "Enable all privacy apps";

    bitwarden.enable = mkBoolOpt false "Enable bitwarden";
    gitcrypt.enable = mkBoolOpt false "Enable git-crypt";
  };

  config = {
    home.packages = with pkgs; [
      (mkIf (cfg.bitwarden.enable || cfg.all.enable) bitwarden-desktop)
      (mkIf (cfg.gitcrypt.enable || cfg.all.enable) git-crypt)
    ];
  };
}
