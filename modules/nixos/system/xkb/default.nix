{
  config,
  lib,
  namespace,
  ...
}:
with lib; let
  cfg = config.${namespace}.system.xkb;
in {
  options.${namespace}.system.xkb = with types; {
    enable = mkBoolOpt false "Whether or not to configure xkb.";
  };

  config = mkIf cfg.enable {
    services.xserver = {
      xkb = {
        layout = "us";
      };
    };
  };
}
