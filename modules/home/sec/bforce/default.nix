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
  wordlists = pkgs.wordlists;
  dirbuster = pkgs.dirbuster;
in
{
  config = mkIf cfg.enable {
    home.packages = with pkgs; [
      thc-hydra
      fcrackzip
      hashcat
    ];

    home.file.".wordlists/seclists".source = "${wordlists}/share/wordlists";
    home.file.".wordlists/dirbuster".source = "${dirbuster}/share/dirbuster";
  };
}
