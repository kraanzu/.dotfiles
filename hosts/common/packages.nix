{pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    # basic utilties
    networkmanagerapplet
    blueberry
    xfce.xfce4-clipman-plugin
    caffeine-ng
    killall
    wget
    git
    htop
    lxde.lxsession
    os-prober
    geoclue2
    unzip
    zip
    xclip
    ripgrep
    bluez
    pulseaudio
    tree

    # shell stuff
    fish
    starship
    eza
    python311Packages.ipython

    # terminal
    wezterm
    kitty
    neovim

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
  ];
}
