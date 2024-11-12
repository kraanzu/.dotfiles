{
  pkgs,
  ...
}: {
  environment.systemPackages = with pkgs; [
    # basic utilties
    blueberry
    networkmanagerapplet
    xfce.xfce4-clipman-plugin
    caffeine-ng
    lxde.lxsession
    flameshot
    gnome-disk-utility
    rofi
    nautilus
    gdrive
    brave
    anydesk
    simplescreenrecorder
    protonvpn-cli_2
    ntfs3g
    gparted
  ];
}
