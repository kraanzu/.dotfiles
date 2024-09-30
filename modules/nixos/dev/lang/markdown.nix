{
  pkgs,
  config,
  lib,
  ...
}: {
  options = {
    mynix.dev.lang.markdown.enable = lib.mkOption {
      type = lib.types.bool;
      default = true;
      description = "Setup markdown stuff";
    };
  };

  config = lib.mkIf config.mynix.dev.lang.markdown.enable {
    environment.systemPackages = with pkgs; [
      # lsp
      marksman
    ];
  };
}
