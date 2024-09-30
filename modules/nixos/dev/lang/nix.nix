{
  pkgs,
  config,
  lib,
  ...
}: {
  options = {
    mynix.dev.lang.nix.enable = lib.mkOption {
      type = lib.types.bool;
      default = true;
      description = "Setup nix stuff";
    };
  };

  config = lib.mkIf config.mynix.dev.lang.nix.enable {
    environment.systemPackages = with pkgs; [
      # lsp
      nixd

      # formatter
      alejandra
    ];
  };
}
