{
  pkgs,
  config,
  lib,
  ...
}: {
  options = {
    mynix.dev.lang.rust.enable = lib.mkOption {
      type = lib.types.bool;
      default = true;
      description = "Setup rust stuff";
    };
  };

  config = lib.mkIf config.mynix.dev.lang.rust.enable {
    environment.systemPackages = with pkgs; [
      # lang
      rustup
    ];
  };
}
