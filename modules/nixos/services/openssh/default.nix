{
  config,
  lib,
  ...
}:
let
  cfg = config.mynix.services.openssh;
in
{
  options.mynix.services.openssh = {
    enable = lib.mkEnableOption "OpenSSH server";
    ports = lib.mkOption {
      type = lib.types.listOf lib.types.port;
      default = [ 22 ];
      description = "Ports to listen on.";
    };
    permitRootLogin = lib.mkOption {
      type = lib.types.enum [
        "yes"
        "without-password"
        "prohibit-password"
        "forced-commands-only"
        "no"
      ];
      default = "no";
    };
    passwordAuthentication = lib.mkOption {
      type = lib.types.bool;
      default = false;
      description = "Allow password auth (key-only by default).";
    };
    openFirewall = lib.mkOption {
      type = lib.types.bool;
      default = true;
    };
  };

  config = lib.mkIf cfg.enable {
    services.openssh = {
      enable = true;
      ports = cfg.ports;
      openFirewall = cfg.openFirewall;
      settings = {
        PermitRootLogin = cfg.permitRootLogin;
        PasswordAuthentication = cfg.passwordAuthentication;
        KbdInteractiveAuthentication = false;
      };
    };
  };
}
