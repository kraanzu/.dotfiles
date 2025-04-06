{
  pkgs,
  config,
  lib,
  namespace,
  ...
}: let
  cfg = config.mynix.dev.lang.nix;
in {
  options = {
    mynix.dev.lang.nix.enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
      description = "Setup nix stuff";
    };
  };

  config = lib.mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      # lsp
      nixd

      # formatter
      alejandra
      nixfmt-rfc-style
    ];
  };
}
