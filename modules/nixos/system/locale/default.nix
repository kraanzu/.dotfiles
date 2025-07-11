{
  lib,
  config,
  ...
}:
let
  cfg = config.mynix.system.locale;
in
{
  options.mynix.system.locale.enable = lib.mkOption {
    type = lib.types.bool;
    default = true;
    description = "Setup locale";
  };

  config = lib.mkIf cfg.enable {
    time.timeZone = "Asia/Kolkata";
    i18n.defaultLocale = "en_IN";

    i18n.extraLocaleSettings = {
      LC_ADDRESS = "en_IN";
      LC_IDENTIFICATION = "en_IN";
      LC_MEASUREMENT = "en_IN";
      LC_MONETARY = "en_IN";
      LC_NAME = "en_IN";
      LC_NUMERIC = "en_IN";
      LC_PAPER = "en_IN";
      LC_TELEPHONE = "en_IN";
      LC_TIME = "en_IN";
    };

    location.latitude = 22.5744;
    location.longitude = 88.3629;
  };
}
