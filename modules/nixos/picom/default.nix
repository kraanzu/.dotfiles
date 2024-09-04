{lib, ...}: {
  imports = [./picom.nix];
  options = {
    mynix.picom.enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
      description = "Enable Picom";
    };
  };
}
