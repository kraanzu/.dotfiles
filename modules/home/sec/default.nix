{
  lib,
  ...
}:

with lib;
with lib.mynix;
{
  options.mynix.sec = {
    enable = mkBoolOpt true "Enable all security tools";
  };
}
