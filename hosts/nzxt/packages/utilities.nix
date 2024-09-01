{
  pkgs,
  pkgs-unstable,
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
    dunst
    gnome.gnome-disk-utility
    rofi
    gnome.nautilus
    vlc
  ];
}
