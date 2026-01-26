{
  lib,
  ...
}:

with lib;
with lib.mynix;
{
  options.mynix.sec = {
    enable = mkBoolOpt false "Enable all security tools";
  };
}
