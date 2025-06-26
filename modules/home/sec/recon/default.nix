{
  config,
  lib,
  pkgs,
  ...
}:

with lib;
with lib.mynix;

let
  cfg = config.mynix.sec;
in
{
  config = mkIf cfg.enable {
    home.packages = with pkgs; [
      subfinder
      amass
      gobuster
      httprobe
      whatweb
    ];
  };
}
