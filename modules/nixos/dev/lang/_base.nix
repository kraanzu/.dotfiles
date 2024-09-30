{pkgs, ...}: {
  config = {
    environment.systemPackages = with pkgs; [
      gnumake # make
      gcc # rust linker issue + CP
      binutils # for binary packaging
    ];
  };
}
