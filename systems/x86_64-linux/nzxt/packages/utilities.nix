{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    # basic utilties
    flameshot
    gdrive
    anydesk
    simplescreenrecorder
    protonvpn-cli_2
    gnome-disk-utility
    ntfs3g
    gparted
  ];
}
