{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    # runners
    gnumake # make

    gcc # rust linker issue + CP
    # extras
    binutils # for binary packaging

    # dev tools
    vscode
  ];
}
