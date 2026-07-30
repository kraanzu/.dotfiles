{
  lib,
  config,
  ...
}:
let
  cfg = config.mynix.system.nix;
in
{
  options.mynix.system.nix.enable = lib.mynix.mkBoolOpt true "Core Nix settings (flakes, nh, comma, nix-ld).";

  config = lib.mkIf cfg.enable {
    nix.settings.experimental-features = [
      "nix-command"
      "flakes"
    ];

    programs.nh = {
      enable = true;
      clean.enable = true;
      clean.extraArgs = "--keep-since 4d --keep 3";
    };

    programs.nix-ld.enable = true;
    programs.nix-index-database.comma.enable = true;
  };
}
