{
  lib,
  pkgs,
  config,
  ...
}:
let
  cfg = config.mynix.system.nix;
in
{
  options.mynix.system.nix.enable =
    lib.mynix.mkBoolOpt true "Core Nix settings (flakes, nh, comma, nix-ld).";

  config = lib.mkIf cfg.enable {
    nix.settings.experimental-features = [
      "nix-command"
      "flakes"
    ];

    programs = {
      nh = {
        enable = true;
        clean.enable = true;
        clean.extraArgs = "--no-direnv --keep-since 4d --keep 1";
      };
      nix-ld = {
        enable = true;
        libraries = with pkgs; [ stdenv.cc.cc ];
      };

      nix-index-database.comma.enable = true;
    };
  };
}
