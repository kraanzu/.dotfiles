{
  config,
  lib,
  options,

  ...
}:
let
  inherit (lib.mynix) mkOpt;
in
{
  options.mynix.home = with lib.types; {
    file = mkOpt attrs { } "A set of files to be managed by home-manager's <option>home.file</option>.";
    configFile =
      mkOpt attrs { }
        "A set of files to be managed by home-manager's <option>xdg.configFile</option>.";
    extraOptions = mkOpt attrs { } "Options to pass directly to home-manager.";
    homeConfig = mkOpt attrs { } "Final config for home-manager.";
  };

  config = {
    mynix.home.extraOptions = {
      home.file = lib.mkAliasDefinitions options.mynix.home.file;
      xdg.enable = true;
      xdg.configFile = lib.mkAliasDefinitions options.mynix.home.configFile;
    };

    snowfallorg.users.${config.mynix.user.name}.home.config =
      lib.mkAliasDefinitions options.mynix.home.extraOptions;

    home-manager = {
      # enables backing up existing files instead of erroring if conflicts exist
      backupFileExtension = "hm.old";

      useUserPackages = true;
      useGlobalPkgs = true;

      verbose = true;
    };
  };
}
