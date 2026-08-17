{ config, ... }:
{
  networking.hostName = "wsl";

  wsl = {
    enable = true;
    defaultUser = "kraanzu";
    wrapBinSh = true;
    extraBin = [
      {
        name = "bash";
        src = config.wsl.binShExe;
      }
    ];
  };

  mynix = {
    system = {
      boot.enable = false;
      sound.enable = false;
      network.enable = false;
      usb.enable = false;
      misc.enable = false;
      xkb.enable = false;
    };
  };

  users.users.kraanzu = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
  };

  system.stateVersion = "24.11";
}
