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
    all.enable = mkBoolOpt true "Enable all secret-related apps";

    onepassword.enable = mkBoolOpt false "Enable 1Password";
    gitcrypt.enable = mkBoolOpt false "Enable git-crypt";
    protonvpn.enable = mkBoolOpt false "Enable ProtonVPN";
  };

  config = {
    home.packages = with pkgs; [
      (mkIf (cfg.onepassword.enable || cfg.all.enable) _1password-gui)
      (mkIf (cfg.gitcrypt.enable || cfg.all.enable) git-crypt)
      (mkIf (cfg.protonvpn.enable || cfg.all.enable) protonvpn-cli_2)
    ];
  };
}
