{
  pkgs,
  config,
  lib,
  namespace,
  ...
}: let
  cfg = config.${namespace}.dev.lang.markdown;
in {
  options = {
    ${namespace}.dev.lang.markdown.enable = lib.mkOption {
      type = lib.types.bool;
      default = true;
      description = "Setup markdown stuff";
    };
  };

  config = lib.mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      # lsp
      marksman
    ];
  };
}