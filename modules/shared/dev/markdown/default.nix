{
  pkgs,
  config,
  lib,
  namespace,
  ...
}: let
  cfg = config.${namespace}.dev.markdown;
in {
  options = {
    ${namespace}.dev.markdown.enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
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
