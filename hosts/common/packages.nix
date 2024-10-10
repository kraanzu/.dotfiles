{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    # basic utilties
    killall
    wget
    git
    htop
    os-prober
    geoclue2
    unzip
    zip
    xclip
    ripgrep
    bluez
    pulseaudio
    tree
    home-manager
    cloc
    imagemagick
    popsicle
    wmctrl
    xdotool

    # shell stuff
    fish
    starship
    eza

    # others
    qbittorrent
  ];
}
