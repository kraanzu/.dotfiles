{pkgs, pkgs-unstable, ...}: {
  environment.systemPackages = (with pkgs; [
    # basic utilties
    networkmanagerapplet
    blueberry
    xfce.xfce4-clipman-plugin
    caffeine-ng
    lxde.lxsession

    # terminal
    wezterm
    kitty

    # gui utils
    sddm
    xfce.thunar
    flameshot
    dunst
    rofi
    vlc
    gnome.gnome-disk-utility
    gnome.nautilus

    # extras
    alejandra
    discord
    qtile
    nodejs_22
    poetry
    python311Packages.pip

    # languages
    zig
  ])

  ++

  (with pkgs-unstable; [
    neovim
  ]);
}
