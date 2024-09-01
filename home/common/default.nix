{
  config,
  ...
}: {
  imports = [
    ./configs.nix
  ];

  nixpkgs = {
    # You can add overlays here
    overlays = [
    ];
    # Configure your nixpkgs instance
    config = {
      allowUnfree = true;
    };
  };

  systemd.user.startServices = "sd-switch";
  home.stateVersion = "23.11";
}
