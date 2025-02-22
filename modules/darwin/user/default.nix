{
  config,
  lib,
  pkgs,
  namespace,
  ...
}: let
  inherit (lib) types mkIf;
  inherit (lib.${namespace}) mkOpt;

  cfg = config.${namespace}.user;
in {
  options.${namespace}.user = {
    name = mkOpt types.str "kraanzu" "The user account.";
    email = mkOpt types.str "kraanzu@gmail.com" "The email of the user.";
    fullName = mkOpt types.str "Murli Tawari" "The full name of the user.";
    uid = mkOpt (types.nullOr types.int) 1000 "The uid for the user account.";
  };

  config = {
    programs.fish.enable = true;
    users.users.${cfg.name} = {
      uid = mkIf (cfg.uid != null) cfg.uid;
      shell = pkgs.fish;
    };
  };
}
