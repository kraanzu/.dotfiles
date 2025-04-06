{

  lib,
  config,
  ...
}:
with lib;
with lib.mynix;
let
  cfg = config.mynix.suites.media;
in
{
  options.mynix.suites.media.enable = lib.mkOption {
    type = lib.types.bool;
    default = false;
    description = "Media Suite";
  };

  config = mkIf cfg.enable {
    mynix = {
      apps = {
        vlc = enabled;
        anydesk = enabled;
        simplescreenrecorder = enabled;
      };

      cli = {
        gdrive = enabled;
      };
    };
  };
}
