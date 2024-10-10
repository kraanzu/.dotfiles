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
    sddm
    flameshot
    gnome-disk-utility
    rofi
    nautilus
    vlc
    gdrive
    firefox
    brave
    anydesk
    simplescreenrecorder
  ];
}
