{
  pkgs,
  pkgs-unstable,
  ...
}: {
  environment.systemPackages =
    (with pkgs; [
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

      # shell stuff
      fish
      starship
      eza
      python311Packages.ipython
    ])
    ++ (with pkgs-unstable; [
      neovim
    ]);
}
