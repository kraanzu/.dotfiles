{
  lib,
  pkgs,
  namespace,
  ...
}:
with lib.${namespace};
{
  environment.systemPath = [ "/opt/homebrew/bin" ];
  ids.gids.nixbld = 350;
  system.stateVersion = 4;
  homebrew.enable = true;

  ${namespace} = {
    archetypes = {
      workstation = enabled;
    };
  };
}