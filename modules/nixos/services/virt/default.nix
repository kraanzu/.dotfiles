{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.mynix.services.virt;
in
{
  options = {
    mynix.services.virt.enable = lib.mkOption {
      type = lib.types.bool;
      default = true;
      description = "Enable Virt manager";
    };
  };

  config = lib.mkIf cfg.enable {
    virtualisation.libvirtd = {
      enable = true;
      qemu = {
        package = pkgs.qemu_kvm;
        runAsRoot = true;
        swtpm.enable = true;
      };
    };
    environment.systemPackages = with pkgs; [
      virt-manager
      virtiofsd
      qemu_kvm
    ];

    users.users.kraanzu.extraGroups = [
      "libvirtd"
      "kvm"
    ];
  };
}
